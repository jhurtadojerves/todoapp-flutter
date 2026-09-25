# Plan: TodoApp en Flutter

> Plan para reconstruir en Flutter la app que hoy existe en React Native + Expo
> (`../todoapp`), con las mismas funcionalidades, el mismo backend (API Django REST)
> y la misma arquitectura por capas. El proyecto Flutter se crea en esta carpeta
> (`todoapp-mobile/flutter`).

**Entorno de referencia:** Flutter 3.44 (stable), Dart 3.12, Android como plataforma
principal (el proyecto RN se compila en Windows, sin Xcode). iOS queda configurado
pero se compila desde macOS o un CI.

---

## 1. Qué hay que replicar

### 1.1 Pantallas y rutas

| Ruta (RN / expo-router) | Pantalla | Notas |
| --- | --- | --- |
| `/` | — | Redirige a `/home`. |
| `/home` (tab) | Home | Bienvenida estática. |
| `/boards` (tab) | Mis tableros | **Protegida:** sin sesión muestra el Login en la misma pestaña. Paginada ("Cargar más"). |
| `/users` (tab) | Listado de usuarios | Protegida igual que Boards. Destino tras login/registro. |
| `/register` | Registro | Validación en vivo + validación de contraseña contra el backend con debounce de 500 ms. |
| `/board/new` | Nuevo tablero | |
| `/board/:id` | Detalle de tablero | Datos + acciones de owner (editar/eliminar) + secciones **Miembros**, **Estados**, **Sprints** (CRUD inline, cada una paginada). |
| `/board/:id/edit` | Editar tablero | |
| `/board/:id/tasks` | Tareas del tablero | Paginada, filtro por estado. |
| `/board/:id/tasks/new` | Nueva tarea | Chips para estado, sprint y asignado. |
| `/board/:id/tasks/:taskId` | Detalle de tarea | Editar/eliminar + **Adjuntos** (foto + GPS) + **Comentarios** (CRUD). |
| `/board/:id/tasks/:taskId/edit` | Editar tarea | |
| `/modal` | Modal de ejemplo | Se puede omitir (plantilla de Expo). |

Header: menú "≡" (popover) con **Cerrar sesión** / **Iniciar sesión**.
Cada pantalla de detalle o edición tiene un "padre lógico" para el botón atrás aunque no
haya historial (`goBackOr(fallback)`), algo necesario si se abre por deep link.

### 1.2 Endpoints consumidos

Base: `API_BASE_URL` (por entorno). Todas las rutas terminan en `/`.

| Recurso | Endpoints | Auth |
| --- | --- | --- |
| Token | `POST /api/v1/auth/token/`, `POST /api/v1/auth/token/refresh/` | No |
| Registro | `POST /api/v1/users/register/`, `POST /api/v1/auth/password/validate/` | No |
| Usuarios | `GET /api/v1/users/?page=` | Sí |
| Tableros | `GET/POST /api/v1/boards/`, `GET/PATCH/DELETE /api/v1/boards/{id}/` | Sí |
| Miembros | `GET/POST /api/v1/boards/{id}/members/`, `DELETE .../members/{mid}/` | Sí |
| Estados | `GET/POST /api/v1/boards/{id}/statuses/`, `PATCH/DELETE .../statuses/{sid}/` | Sí |
| Sprints | `GET/POST /api/v1/boards/{id}/sprints/`, `PATCH/DELETE .../sprints/{sid}/` | Sí |
| Tareas | `GET/POST /api/v1/boards/{id}/tasks/?page=&status=&sprint=&assigned_to=`, `GET/PATCH/DELETE /api/v1/tasks/{tid}/` | Sí |
| Comentarios | `GET/POST /api/v1/tasks/{tid}/comments/`, `PATCH/DELETE .../comments/{cid}/` | Sí |

Listados con paginación DRF: `{count, next, previous, results}`. El JSON viaja en
**snake_case** y el dominio usa camelCase.

### 1.3 Reglas de negocio que no se pueden perder

- **Sesión:** access y refresh token en almacenamiento seguro. `userId` sale del claim
  `user_id` del JWT. La sesión solo se restaura si están **ambos** tokens.
- **Registro:** después de registrar, login automático con las mismas credenciales, porque el
  registro no devuelve tokens.
- **Refresh:** ante un 401 en una petición autenticada se refresca el token y se reintenta
  **una vez**. Los refresh concurrentes se unifican en una sola llamada, porque el
  backend rota el refresh token y una segunda llamada fallaría. Si el refresh falla, se
  borran los tokens y se navega a `/boards`. Si el refresh no devuelve `refresh`, se
  conserva el anterior.
- **Errores**, en cuatro familias con mensajes en español:
  `NetworkError` (sin conexión), `TimeoutError`, `ServerError` (5xx o una respuesta que no
  cumple el esquema) y `ApiError` (4xx, que toma `detail` o el primer error de campo
  `{"campo": ["..."]}`, con mensajes por defecto para 401/403/404/429).
- **Validación de contrato:** toda respuesta se parsea contra el modelo. Si no encaja, se
  trata como `ServerError`, igual que Zod en RN.
- **Permisos por rol:** solo el `owner` del tablero edita o elimina el tablero, invita o quita
  miembros. Un comentario lo gestiona su autor o el owner.
- **Validaciones de formularios:**
  - Username: `^[\w.@+-]+$`, 150 caracteres como máximo.
  - Email válido.
  - Las dos contraseñas coinciden.
  - Título de tarea y nombre de tablero obligatorios (con trim).
  - Fechas de sprint `YYYY-MM-DD` u opcionales.
  - Estados nuevos con `order = cantidad actual` y color por defecto.
- **Adjuntos**, solo en el dispositivo porque el backend no tiene ese campo:
  - La foto se copia a `documents/task-attachments/` y el índice se guarda en `index.json`.
  - Se ordenan del más nuevo al más viejo; un índice corrupto se trata como vacío.
  - Cámara obligatoria: si el permiso quedó bloqueado, se muestra un enlace a Ajustes.
  - GPS opcional: si falta, la foto se guarda sin coordenadas y se muestra un aviso con
    enlace a Ajustes.
- **Seguridad de red:** HTTP en claro solo hacia `10.0.2.2`, `localhost` y `127.0.0.1`.
  Un build de producción con una base URL que no sea HTTPS debe fallar al arrancar.

### 1.4 Lo que NO hay que copiar

- Las listas de RN **no se recargan al volver** a la pantalla, porque solo cargan al
  montarse. Por eso, tras crear un tablero o una tarea, la lista queda desactualizada.
  En Flutter, invalidar el provider de la lista después de crear, editar o borrar (ver §3.4).
- Componentes de plantilla sin uso (`modal`, `hello-wave`, `themed-*`).

---

## 2. Stack elegido

| Necesidad | RN actual | Flutter | Por qué |
| --- | --- | --- | --- |
| Estado / ViewModels | hooks `useXxxViewModel` | **Riverpod 3** (`Notifier`/`AsyncNotifier`) + `riverpod_generator` | Un notifier por pantalla equivale a un viewmodel. Su DI reemplaza a `shared/di/dependencies.ts` y es fácil de sustituir en tests. |
| Navegación | expo-router (archivos) | **go_router** con `StatefulShellRoute` para las tabs | Rutas declarativas con los mismos paths, `redirect` para el guard de sesión y deep links. |
| HTTP | axios + interceptores | **dio** + `QueuedInterceptorsWrapper` | Tiene interceptores y timeouts como axios, y la cola resuelve de forma nativa el refresh concurrente. |
| Modelos + validación | Zod | **freezed** + **json_serializable** (`fieldRename: FieldRename.snake`) | Tipos inmutables. Un `fromJson` que falla es el equivalente a un `safeParse` fallido, y snake_case se resuelve por anotación, sin la conversión profunda de claves. |
| Almacenamiento seguro | expo-secure-store | **flutter_secure_storage** | Keychain / Keystore. |
| UI | Tamagui | **Material 3** con `ThemeData` a partir de los mismos tokens de color | No hace falta una librería de UI extra. |
| Cámara | expo-image-picker | **image_picker** | |
| GPS | expo-location | **geolocator** | Permisos y posición con `LocationAccuracy.medium`, equivalente a `Balanced`. |
| Permisos / Ajustes | `canAskAgain` + `Linking.openSettings` | **permission_handler** (`isPermanentlyDenied`, `openAppSettings()`) | |
| Archivos | expo-file-system | **path_provider** + `dart:io` | |
| Config por entorno | `.env` + `EXPO_PUBLIC_*` | `--dart-define-from-file=env/dev.json` + `String.fromEnvironment` | Se inyecta en tiempo de compilación, igual que `EXPO_PUBLIC_*`, así que no debe contener secretos. |
| Háptica en tabs | expo-haptics | `HapticFeedback.selectionClick()` (SDK) | |
| Íconos | Ionicons | `Icons.home`, `Icons.grid_view`, `Icons.people` | |
| Tests unitarios | Jest | **flutter_test** + **mocktail** | |
| Integración | RNTL + axios-mock-adapter | **widget tests** + **http_mock_adapter** (sobre dio) | Mismo enfoque: pantalla real con la pila real y solo la red simulada. |
| E2E | Maestro | **integration_test** + **Maestro** (reutilizando los flujos) | Ver §5.3. |
| Lints | eslint-config-expo | **flutter_lints** (o `very_good_analysis`) | |

---

## 3. Arquitectura

### 3.1 Estructura de carpetas

Espejo de `src/` en RN, organizada por capas:

```
flutter/
├── lib/
│   ├── main.dart                     # ProviderScope + MaterialApp.router
│   ├── app/
│   │   ├── router.dart               # go_router: rutas, shell de tabs, redirect de sesión
│   │   └── theme.dart                # tokens de color → ThemeData
│   ├── core/                         # = src/shared
│   │   ├── config/api_config.dart    # API_BASE_URL, timeout, chequeo HTTPS en release
│   │   ├── network/
│   │   │   ├── api_client.dart       # instancia dio + interceptores
│   │   │   ├── auth_interceptor.dart # Bearer + refresh/reintento (Queued)
│   │   │   ├── api_exception.dart    # NetworkError/TimeoutError/ServerError/ApiError
│   │   │   └── api_call.dart         # apiCall<T>(request, fromJson): traduce errores y valida el contrato
│   │   ├── storage/secure_storage.dart
│   │   └── utils/jwt.dart, confirm_dialog.dart
│   ├── domain/
│   │   ├── models/                   # freezed: Board, Task, Sprint, BoardStatus, Membership, Comment, User, TokenPair, Paginated<T>, TaskAttachment
│   │   ├── repositories/             # interfaces abstractas
│   │   └── usecases/                 # una clase por caso de uso (login, get_boards, …)
│   ├── data/
│   │   ├── datasources/              # remotos (dio) + attachment_local_datasource.dart
│   │   └── repositories/             # implementaciones
│   └── presentation/
│       ├── providers/                # session_provider.dart + providers de DI (repos, usecases)
│       ├── viewmodels/               # un Notifier por pantalla/sección
│       ├── screens/
│       └── widgets/                  # AppButton, AppInput, ChipPicker, BoardCard, TaskCard, …
├── test/                             # unit + widget/integración
├── integration_test/                 # e2e en Dart
├── .maestro/                         # flujos e2e (adaptados de ../todoapp/.maestro)
├── env/dev.json, env/prod.json
└── android/app/src/main/res/xml/network_security_config.xml
```

**Convención:** mantener los mismos nombres de casos de uso, repositorios y datasources
que en RN, en `snake_case` para los archivos. Así cada archivo tiene su par directo y la
comparación entre las dos apps sirve en clase.

### 3.2 Capa de red

- `apiClient` = `Dio(BaseOptions(baseUrl, connectTimeout/receiveTimeout = API_TIMEOUT_MS))`.
- `AuthInterceptor extends QueuedInterceptor`:
  - `onRequest` agrega el Bearer salvo si `options.extra['authenticated'] == false`
    (login, registro, refresh y validación de contraseña).
  - `onError` ante un 401 autenticado sin reintentos previos: `await session.refresh()`.
    Si devuelve token, reintenta la petición con `extra['retried']=true`; si no, llama a
    `onUnauthorized()`. Al estar encolado, los 401 simultáneos esperan un único refresh.
  - El refresh usa una **instancia de dio aparte**, sin el interceptor, para evitar
    recursión.
- `apiCall<T>()` envuelve cada llamada:
  - `DioExceptionType.connectionTimeout`/`receiveTimeout` → `TimeoutError`.
  - `connectionError`/`unknown` sin respuesta → `NetworkError`.
  - Status ≥ 500 → `ServerError`.
  - 4xx → `ApiError`, parseando `detail` o los errores de campo.
  - Un `fromJson` que lanza (`CheckedFromJsonException`/`TypeError`) → `ServerError`, con
    `debugPrint` en modo debug.
  - 204 → `null`.
- `validatePassword` **no lanza error**: devuelve `{isValid, errors}` leyendo `password: [...]`
  del 400, como en RN.

### 3.3 Sesión y guard de rutas

- `SessionNotifier` (`AsyncNotifier<Session?>`), equivalente a `useAuthSession`:
  - `build()` restaura los tokens desde el almacenamiento seguro.
  - Métodos: `login`, `register`, `logout`, `refresh` (unificado con un
    `Future<String?>? _inFlight`).
  - Expone `userId` (decodificado del JWT) e `isAuthenticated`.
- go_router: `refreshListenable` conectado al estado de sesión.
  - Las pestañas **Boards** y **Users** no redirigen: se replica el comportamiento RN, en
    el que la pestaña muestra `LoginScreen` si no hay sesión. Un widget `AuthGate`
    decide qué mostrar.
  - Las rutas `/board/**` sí redirigen a `/boards` sin sesión.
  - Tras login o registro: `context.go('/users')`.
- `onUnauthorized` limpia los tokens y hace `router.go('/boards')`.

### 3.4 ViewModels

- Una lista paginada es un `AsyncNotifier` con estado
  `{items, page, hasMore, isLoadingMore}` y los métodos `loadMore()` y `reload()`. Conviene
  un mixin o clase base `PaginatedNotifier<T>` para boards, tasks, users, members,
  statuses, sprints y comments, porque en RN esa lógica está copiada 7 veces.
- Un formulario es un `Notifier` con los campos, los errores por campo, `isSubmitting`,
  `canSubmit` y `submit()`.
- Después de crear, editar o borrar: `ref.invalidate(boardsProvider)` o del provider que
  corresponda. Esto corrige el bug de §1.4.
- Providers `family` por id: `boardDetailProvider(boardId)`, `tasksProvider(boardId)`,
  `taskFormProvider((boardId, taskId))`, etc., con `autoDispose`.

### 3.5 UI

- `AppButton` (lleno/contorno + spinner), `AppInput` (placeholder como `labelText` y
  **`Semantics(label:)`**, que Maestro necesita), `AppTitle`, `ChipPicker`
  (`Wrap` de `ChoiceChip`) y `HeaderBackButton` con fallback.
- Colores:
  - `background #f8fafc`, `backgroundSoft #ffffff`, `text #0f172a`, `muted #6b7280`
  - `border #d1d5db`, `primary #0a7ea4`, `danger #ef4444`
- Confirmaciones con `showDialog` + `AlertDialog`, botones "Cancelar" / "Eliminar".
- Mantener **los mismos textos** que en RN ("Acceder", "Mis tableros", "Crear tablero",
  "Ver tareas", "Nueva", "Crear tarea", "Eliminar tarea", "Cerrar sesión", …). Así se
  reutilizan los flujos Maestro y los textos de los tests.

---

## 4. Fases de implementación

Cada fase termina con la app compilando, `flutter analyze` limpio y sus tests en verde.

### Fase 0 — Proyecto base
- `flutter create --org com.jhurtadojerves --project-name todoapp_flutter --platforms android,ios .`
  - El `applicationId` queda como `com.jhurtadojerves.todoapp_flutter`, así puede convivir
    en el mismo dispositivo con la app RN.
- Dependencias:
  - Runtime: `flutter_riverpod`, `riverpod_annotation`, `go_router`, `dio`,
    `freezed_annotation`, `json_annotation`, `flutter_secure_storage`, `image_picker`,
    `geolocator`, `permission_handler`, `path_provider`.
  - Dev: `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`, `mocktail`,
    `http_mock_adapter`, `integration_test` (SDK), `flutter_lints`.
- `env/dev.json` (`API_BASE_URL=http://10.0.2.2:8080`, `API_TIMEOUT_MS=15000`) y `env/prod.json` (HTTPS).
- Android:
  - `network_security_config.xml` idéntico al del plugin `withScopedCleartextTraffic`, más
    `android:networkSecurityConfig` en el manifest.
  - Permisos `CAMERA`, `ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION`.
- iOS: `NSCameraUsageDescription` y `NSLocationWhenInUseUsageDescription` con los mismos
  textos de `app.json`.
- Ícono y splash: copiar `assets/images` de RN y usar `flutter_launcher_icons` y
  `flutter_native_splash`.

**Criterio de aceptación:** la app arranca en el emulador con el tema aplicado y las 3 tabs vacías.

### Fase 1 — Core
- `api_config.dart` con la verificación de HTTPS en release (`kReleaseMode`).
- `api_client`, `api_exception`, `api_call`, `secure_storage`, `jwt`.
- Tests: portar `http-client.test.ts`, `jwt.test.ts` y `query-string.test.ts`. La
  conversión de claves no hace falta porque la resuelve `json_serializable`; en su lugar,
  testear el `fromJson`/`toJson` de cada modelo.

**Criterio de aceptación:** cobertura de los 4 tipos de error y del parseo de `detail`/errores de campo.

### Fase 2 — Dominio y datos
- Modelos freezed de `src/domain/models/*.ts`, respetando los nullables: `sprint`,
  `status`, `assignedToId`, `profile`, las fechas de sprint y la ausencia de `refresh` en
  la respuesta del refresh.
- Interfaces de repositorio, datasources remotos, implementaciones y los 33 casos de uso.
- Providers de DI en `presentation/providers/dependencies.dart`.
- Tests: portar los 53 archivos de `src/__tests__/{domain,data}` con mocktail.

**Criterio de aceptación:** los mismos casos que cubre Jest, pasando con `flutter test`.

### Fase 3 — Autenticación
- `SessionNotifier`, `AuthInterceptor` y router con shell de tabs, `AuthGate` y redirects.
- `LoginScreen` y `RegisterScreen`, con debounce de 500 ms mediante un `Timer` cancelado
  en cada cambio y en `dispose`.
- Menú del header con logout.

**Criterio de aceptación:**
- Login y registro contra el backend real.
- La sesión sobrevive a reiniciar la app.
- Un access token vencido se renueva de forma transparente.

### Fase 4 — Tableros
- `BoardsScreen` (lista + "Cargar más" + vacío + error/"Reintentar"), `BoardFormScreen`
  (crear y editar) y `BoardDetailScreen`.
- Secciones del detalle como widgets separados, cada uno con su notifier:
  - Miembros: invitar por email y quitar, solo el owner.
  - Estados: crear, editar inline y borrar.
  - Sprints: crear y editar con fechas validadas.

**Criterio de aceptación:** CRUD completo, y las listas reflejan los cambios sin recargar a mano.

### Fase 5 — Tareas y comentarios
- `TasksScreen` con filtro por estado, `TaskFormScreen` con 3 `ChipPicker` (opciones
  cargadas en paralelo con `Future.wait`) y `TaskDetailScreen`.
- Comentarios: listar, crear, editar y borrar. `canManage` = owner o autor.

**Criterio de aceptación:** los ids elegidos en los chips llegan como `status_id`,
`sprint_id` y `assigned_to_id`; un valor sin elegir se envía como `null`.

### Fase 6 — Adjuntos (cámara + GPS)
- `AttachmentLocalDataSource` sobre `getApplicationDocumentsDirectory()`, con el mismo
  formato de `index.json` para facilitar la comparación.
- `TaskAttachmentsNotifier` con la misma máquina de estados que
  `use-task-attachments-viewmodel.ts`: `captureError`, `isCameraPermissionBlocked`,
  `locationWarning` y `isLocationPermissionBlocked`.
- Tarjetas de error y aviso con el enlace "Abrir configuración del sistema" →
  `openAppSettings()`.
- Guía de referencia: `CAMARA_UBICACION.md` y `PLAN_NOTIFICACIONES_PERMISOS.md` del proyecto RN.

**Criterio de aceptación:** se cubren los 4 casos de permisos: cámara denegada, cámara
bloqueada, GPS denegado y GPS bloqueado.

### Fase 7 — Usuarios, Home y pulido
- `UsersScreen` paginada y Home.
- Accesibilidad: `Semantics` en inputs y botones, y tamaños táctiles de 48 dp o más.
- Háptica en las tabs y estados de carga consistentes.

### Fase 8 — Tests (ver §5) y CI
- GitHub Actions: `flutter analyze`, `dart format --set-exit-if-changed`,
  `flutter test --coverage`.

### Fase 9 — Build y distribución
- `flutter build apk --release --dart-define-from-file=env/prod.json`, con firma vía
  `key.properties`, que no se commitea.
- Documento `BUILD_APK.md` equivalente al de RN.

---

## 5. Estrategia de tests

Replica la pirámide que ya tiene el proyecto RN (411 tests), con la misma división.

### 5.1 Unitarios (`test/unit/`)
- Casos de uso, repositorios y datasources remotos con mocktail.
- Datasource de adjuntos sobre un directorio temporal (`Directory.systemTemp.createTemp`).
- `SessionNotifier` con un `ProviderContainer` y overrides: restauración, login,
  registro + login, logout, refresh unificado y refresh fallido.
- Notifiers de formularios y el de adjuntos, con `image_picker`, `geolocator` y
  `permission_handler` detrás de una interfaz propia (`DevicePermissions`,
  `CameraService`, `LocationService`) para poder mockearlos.
- Debounce del registro con `fakeAsync` + `async.elapse(500ms)`.

### 5.2 Integración (`test/integration/`)
- Widget tests que montan la pantalla real con `ProviderScope`, DI real, dio real con
  `DioAdapter` (http_mock_adapter) y un `FlutterSecureStorage` falso en memoria. Solo se
  simulan la red, el almacenamiento seguro y el router: un `GoRouter` de prueba o un
  `MockGoRouter`.
- Portar los casos de `src/__tests__/integration/screens/*.tsx`:
  - Login OK, 401, sin red, y la pestaña Boards pidiendo login.
  - Registro completo y reglas de contraseña.
  - Listado, paginación, reintento y contrato roto.
  - Crear/editar tablero y tarea verificando el body en snake_case.
  - 401 → refresh → reintento, y refresh inválido → logout.

### 5.3 E2E
- **Maestro:**
  - Copiar `../todoapp/.maestro` y cambiar `appId` por
    `com.jhurtadojerves.todoapp_flutter`, o parametrizarlo con `${APP_ID}` para correr la
    misma suite contra las dos apps.
  - Funciona con Flutter porque Maestro lee el árbol de accesibilidad. Por eso cada
    input debe exponer su label con `Semantics` o `labelText`.
- **integration_test** (opcional, en Dart): un flujo feliz login → tablero → tarea
  contra un backend de pruebas, útil en CI con un emulador.

---

## 6. Correspondencia rápida RN → Flutter

| RN | Flutter |
| --- | --- |
| `useXxxViewModel()` | `ref.watch(xxxProvider)` + `ref.read(xxxProvider.notifier)` |
| `AuthProvider` / `useAuth()` | `sessionProvider` |
| `dependencies.xUseCase` | `ref.read(xUseCaseProvider)` |
| `useEffect(() => load(), [id])` | `build()` del `AsyncNotifier` con `family(id)` |
| `router.push/replace/back` | `context.push/go/pop` |
| `goBackOr(href)` | `context.canPop() ? context.pop() : context.go(href)` |
| `Alert.alert` / `confirmAction` | `showDialog<bool>` |
| `FlatList` + footer "Cargar más" | `ListView.separated` + último ítem con botón |
| `SafeAreaView` | `SafeArea` / `Scaffold` |
| `Platform.OS === 'web'` | `kIsWeb` |
| `__DEV__` | `kDebugMode` |
| Zod `safeParse` | `try { Model.fromJson(json) } on Object { throw ServerError() }` |

---

## 7. Riesgos y decisiones abiertas

| Tema | Riesgo / decisión | Propuesta |
| --- | --- | --- |
| Web | La app RN también corre en web (`localStorage`, `window.confirm`). | Fuera de alcance en la primera versión. `flutter_secure_storage` tiene soporte web limitado; si se necesita, agregarlo en una fase extra. |
| iOS | No se puede compilar en Windows. | Dejar el `Info.plist` listo y compilar con Codemagic o GitHub Actions en macOS. |
| Paridad visual | Tamagui y Material se ven distinto. | Priorizar paridad funcional y de textos; lo visual se ajusta con el tema. |
| Generación de código | freezed y riverpod_generator agregan el paso `build_runner`. | Documentar `dart run build_runner watch -d`. Los `*.g.dart` y `*.freezed.dart` se commitean o se generan en CI (elegir uno). |
| Backend local | Emulador → `10.0.2.2`; dispositivo físico → IP de la LAN (como el `.env` actual). | Un `env/dev-device.json` con la IP de la LAN, que no se commitea. |
| Adjuntos | Se guardan solo en el dispositivo y no se sincronizan entre apps. | Aceptado, igual que en RN. |

---

## 8. Orden sugerido y estimación

| Fase | Contenido | Estimación |
| --- | --- | --- |
| 0 | Proyecto base | 0,5 día |
| 1 | Core + tests | 1 día |
| 2 | Dominio y datos + tests | 1,5 días |
| 3 | Autenticación | 1,5 días |
| 4 | Tableros | 2 días |
| 5 | Tareas y comentarios | 2 días |
| 6 | Adjuntos | 1 día |
| 7 | Usuarios, Home y pulido | 0,5 día |
| 8 | Tests de integración, e2e y CI | 1,5 días |
| 9 | Build y distribución | 0,5 día |
| | **Total** | **~12 días** |

Las fases 4 a 7 se pueden hacer en paralelo una vez cerrada la 3.
