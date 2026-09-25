# Guía de pruebas, depuración y validación — TodoApp Flutter

Tema de la semana: **pruebas, depuración, monitoreo y validación de la aplicación conectada**.

Esta guía recorre las pruebas que ya existen en el proyecto, ordenadas de la más
rápida y aislada a la más lenta y cercana al usuario real. Cada sección explica
qué valida el tipo de prueba, enlaza a los tests más representativos y da el
comando para ejecutarlos.

> Todos los comandos se ejecutan desde la carpeta `flutter/` (raíz del proyecto).

---

## 1. Mapa generalS

| # | Tipo | Carpeta | ¿Necesita dispositivo? | ¿Necesita backend? | Cantidad aprox. |
|---|------|---------|------------------------|--------------------|-----------------|
| 1 | Unitarias | [test/unit/](../test/unit/) | No | No (red simulada) | ~136 |
| 2 | De widget | [test/widget_test.dart](../test/widget_test.dart) | No | No | 1 |
| 3 | Integración de pantallas (widget + red simulada) | [test/integration/](../test/integration/) | No | No (red simulada) | 7 |
| 4 | Integración nativa | [integration_test/](../integration_test/) | **Sí** (emulador) | No | 1 |
| 5 | End-to-end (E2E) con Maestro | [.maestro/flows/](../.maestro/flows/) | **Sí** (APK instalado) | **Sí** (backend real) | 3 flujos |
| — | Validación estática y CI | [.github/workflows/flutter.yml](../.github/workflows/flutter.yml) | No | No | — |

```
            ▲  más lento, más realista
            │   5. E2E Maestro      (app real + backend real)
            │   4. Integración nativa (app real en emulador)
            │   3. Pantallas + red simulada
            │   2. Widget
            │   1. Unitarias
            ▼  más rápido, más aislado
```

### Herramientas usadas

| Paquete | Para qué se usa |
|---------|-----------------|
| `flutter_test` | `test()`, `testWidgets()`, `expect`, `find`, `WidgetTester` |
| `mocktail` | Mocks de repositorios y de `FlutterSecureStorage` (`when`, `verify`) |
| `http_mock_adapter` | `DioAdapter`: simula respuestas HTTP del backend Django sin red |
| `integration_test` | Ejecuta la app real dentro de un emulador/dispositivo |
| Riverpod `ProviderContainer` / `ProviderScope(overrides:)` | Inyecta fakes y mocks en lugar de las dependencias reales |
| Maestro (CLI externa) | Automatiza toques y textos sobre el APK instalado |

---

## 2. Pruebas unitarias

**Qué validan:** una pieza de lógica aislada (un modelo, un caso de uso, un
viewmodel, un interceptor) sin pintar UI. Las dependencias externas se
reemplazan por mocks, fakes o un `DioAdapter` que responde como el backend.

**Comando (todas):**

```powershell
flutter test test/unit
```

Como hay varios subtipos, se agrupan así:

### 2.1 Contratos de modelos (JSON ↔ Dart)

Validan que los modelos `freezed`/`json_serializable` lean el `snake_case` del
backend y rechacen respuestas mal formadas.

- [models_test.dart:5 — Board parsea contrato snake_case y serializa](../test/unit/models_test.dart#L5)
- [models_test.dart:103 — Membership rechaza rol desconocido](../test/unit/models_test.dart#L103)
- [models_test.dart:115 — Task rechaza status anidado mal formado](../test/unit/models_test.dart#L115)

```powershell
flutter test test/unit/models_test.dart
```

### 2.2 Capa de red: errores, configuración y refresh de token

Aquí está lo más importante para una **app conectada**: cómo se traducen los
errores HTTP, timeouts y respuestas inesperadas, y cómo se renueva el JWT.

- [core_test.dart:15 — Configuración: HTTPS obligatorio en release, HTTP solo local en desarrollo](../test/unit/core_test.dart#L15)
- [core_test.dart:79 — Un 4xx conserva mensaje y código de estado (`ApiError`)](../test/unit/core_test.dart#L79)
- [core_test.dart:90 — Un 5xx se convierte en `ServerError`](../test/unit/core_test.dart#L90)
- [core_test.dart:97 — Contrato roto (200 con JSON inesperado) → `ServerError`](../test/unit/core_test.dart#L97)
- [core_test.dart:108 — Timeouts y errores de conexión se traducen a mensajes de usuario](../test/unit/core_test.dart#L108)
- [core_test.dart:204 — Dos 401 concurrentes refrescan el token **una sola vez** y reintentan](../test/unit/core_test.dart#L204)
- [core_test.dart:237 — Si el refresh falla se cierra la sesión](../test/unit/core_test.dart#L237)

```powershell
flutter test test/unit/core_test.dart
# Solo el grupo del interceptor:
flutter test test/unit/core_test.dart --plain-name "Refresh interceptor"
```

### 2.3 Pipelines por feature (datasource → repositorio → caso de uso)

Un archivo por recurso del API. Todos siguen el mismo patrón de tres pruebas por
endpoint: **ruta/parámetros/contrato**, **propaga error del servidor** y
**rechaza contrato roto**. El más representativo es el de tableros:

- [board_pipeline_test.dart:23 — GetBoards: ruta, parámetros y contrato](../test/unit/board_pipeline_test.dart#L23)
- [board_pipeline_test.dart:47 — GetBoards: propaga error del servidor](../test/unit/board_pipeline_test.dart#L47)
- [board_pipeline_test.dart:60 — GetBoards: rechaza contrato roto](../test/unit/board_pipeline_test.dart#L60)
- [task_pipeline_test.dart:134 — CreateTask: ruta, parámetros y contrato](../test/unit/task_pipeline_test.dart#L134)

Resto de pipelines: [comment](../test/unit/comment_pipeline_test.dart),
[membership](../test/unit/membership_pipeline_test.dart),
[sprint](../test/unit/sprint_pipeline_test.dart),
[status](../test/unit/status_pipeline_test.dart),
[user](../test/unit/user_pipeline_test.dart).

```powershell
# Todos los pipelines
flutter test test/unit --name "propaga|contrato roto|: ruta"
# Uno solo
flutter test test/unit/board_pipeline_test.dart
```

> Nota: `--name` acepta expresiones regulares y filtra por nombre de test;
> `--plain-name` busca texto literal.

### 2.4 Estado y viewmodels (Riverpod + mocktail)

Validan la lógica de presentación sin UI, usando `ProviderContainer` con
repositorios mockeados. Cubren condiciones de carrera típicas de apps conectadas.

- [session_test.dart:46 — El login persiste los tokens](../test/unit/session_test.dart#L46)
- [session_test.dart:99 — Un refresh tardío no restaura una sesión ya cerrada](../test/unit/session_test.dart#L99)
- [forms_test.dart:22 — Nombre vacío impide enviar (no llama al repositorio)](../test/unit/forms_test.dart#L22)
- [forms_test.dart:34 — El doble envío se bloquea y los valores se recortan](../test/unit/forms_test.dart#L34)
- [pagination_test.dart:26 — Una carga "más" tardía no sobrescribe la lista recargada](../test/unit/pagination_test.dart#L26)

```powershell
flutter test test/unit/session_test.dart test/unit/forms_test.dart test/unit/pagination_test.dart
```

### 2.5 Almacenamiento seguro y servicios del dispositivo (fakes)

Validan persistencia de tokens y el manejo de permisos de cámara/GPS usando
clases *fake* en lugar de hardware real.

- [storage_test.dart:18 — Sesión incompleta (falta access o refresh) se limpia](../test/unit/storage_test.dart#L18)
- [storage_test.dart:36 — Un fallo al escribir no deja una pareja de tokens parcial](../test/unit/storage_test.dart#L36)
- [attachments_test.dart:93 — Cámara denegada/bloqueada no guarda adjunto](../test/unit/attachments_test.dart#L93)
- [attachments_test.dart:122 — GPS denegado guarda la foto sin coordenadas](../test/unit/attachments_test.dart#L122)
- [attachments_test.dart:68 — Escrituras concurrentes no pierden fotos](../test/unit/attachments_test.dart#L68)

```powershell
flutter test test/unit/storage_test.dart test/unit/attachments_test.dart
```

---

## 3. Pruebas de widget

**Qué validan:** que un widget (aquí, la app completa) se pinte y responda a
interacciones, dentro de un entorno de prueba sin emulador. Se reemplaza el
almacenamiento seguro por `MemoryTokens` para no depender del plugin nativo.

- [widget_test.dart:24 — Home visible y la pestaña protegida pide login sin sesión](../test/widget_test.dart#L24)
- [widget_test.dart:8 — `MemoryTokens`: fake reutilizado por otros tests](../test/widget_test.dart#L8)

```powershell
flutter test test/widget_test.dart
```

---

## 4. Pruebas de integración de pantallas (widget + red simulada)

**Qué validan:** flujos completos de usuario a través de varias pantallas
(router, providers, viewmodels, repositorios, datasources y Dio **reales**), con
la única diferencia de que las respuestas HTTP vienen de un `DioAdapter`. Son la
forma más barata de probar la **app conectada de punta a punta** sin backend.

El helper [`mount()`](../test/integration/screens_test.dart#L40) muestra el
patrón: `ProviderScope(overrides: [...])` inyecta el `Dio` simulado.

- [screens_test.dart:72 — Login con red simulada navega a Usuarios y guarda tokens](../test/integration/screens_test.dart#L72)
- [screens_test.dart:99 — Login 401 muestra el detalle del backend y no guarda sesión](../test/integration/screens_test.dart#L99)
- [screens_test.dart:112 — Lista paginada conserva los tableros al "Cargar más"](../test/integration/screens_test.dart#L112)
- [screens_test.dart:136 — Contrato roto muestra error y botón "Reintentar"](../test/integration/screens_test.dart#L136)
- [screens_test.dart:193 — Los chips envían `status_id`, `sprint_id` y `assigned_to_id` correctos](../test/integration/screens_test.dart#L193)
- [screens_test.dart:318 — Registro espera 500 ms (debounce) antes de validar la contraseña](../test/integration/screens_test.dart#L318)

```powershell
flutter test test/integration
# Un solo escenario:
flutter test test/integration/screens_test.dart --plain-name "Login 401"
```

> Aunque la carpeta se llama `integration`, estos tests corren con
> `flutter test` normal (sin emulador). No confundir con la sección 5.

---

## 5. Pruebas de integración nativas (`integration_test`)

**Qué validan:** que la app **real** arranque en un emulador/dispositivo, con
plugins nativos (almacenamiento seguro, etc.) y el `main()` de producción.
No toca el backend: solo navega por pantallas públicas.

- [smoke_test.dart:8 — Arranque nativo y acceso a registro sin sesión](../integration_test/smoke_test.dart#L8)

```powershell
# 1. Ver dispositivos disponibles
flutter devices
# 2. Ejecutar (reemplazar emulator-5554 por el id de tu emulador)
flutter test integration_test/smoke_test.dart -d emulator-5554 --dart-define-from-file=env/dev.json
```

---

## 6. Pruebas end-to-end con Maestro

**Qué validan:** el comportamiento que ve el usuario final sobre el **APK
instalado**, hablando con el **backend real de pruebas**. Es la validación más
cercana a producción de la app conectada. Ver también [.maestro/README.md](../.maestro/README.md).

- [01-login-invalid.yaml — Credenciales inválidas muestran el error de Django](../.maestro/flows/01-login-invalid.yaml)
- [02-board-task-lifecycle.yaml — Login → crear tablero → crear tarea → eliminar ambos](../.maestro/flows/02-board-task-lifecycle.yaml) *(el más representativo)*
- [03-logout.yaml — Cerrar sesión vuelve a proteger las pestañas](../.maestro/flows/03-logout.yaml)
- [subflows/login.yaml — Subflujo reutilizable de login](../.maestro/subflows/login.yaml)

**Requisitos:** Maestro CLI instalado, emulador encendido, APK instalado
(ver [BUILD_APK.md](../BUILD_APK.md)), backend accesible y una cuenta de pruebas.

```powershell
# Todos los flujos
maestro test -e E2E_EMAIL=cuenta-de-pruebas -e E2E_PASSWORD=clave-de-pruebas .maestro/flows

# Un solo flujo
maestro test -e E2E_EMAIL=cuenta-de-pruebas -e E2E_PASSWORD=clave-de-pruebas .maestro/flows/02-board-task-lifecycle.yaml

# Solo los flujos con la etiqueta "auth"
maestro test --include-tags=auth -e E2E_EMAIL=cuenta-de-pruebas -e E2E_PASSWORD=clave-de-pruebas .maestro/flows
```

> Las credenciales se pasan con `-e`; nunca se escriben en los YAML.

---

## 7. Validación estática e integración continua

Antes de cualquier test, el código se valida con el formateador y el analizador
(reglas de [analysis_options.yaml](../analysis_options.yaml)). El pipeline de
GitHub Actions ([flutter.yml](../.github/workflows/flutter.yml)) ejecuta en cada
push a `main` y en cada pull request exactamente esta secuencia:

```powershell
flutter pub get
dart run build_runner build                                              # genera código freezed/json/riverpod
dart format --output=none --set-exit-if-changed lib test integration_test # formato
flutter analyze                                                          # análisis estático / lints
flutter test --coverage                                                  # tests 1–4 (sin dispositivo) + cobertura
```

La cobertura queda en `coverage/lcov.info` y CI la publica como artefacto
`coverage`. Para verla en HTML (requiere `lcov` instalado, p. ej. en WSL o con
Chocolatey):

```powershell
genhtml coverage/lcov.info -o coverage/html
start coverage/html/index.html
```

---

## 8. Depuración de tests y de la app

### Ejecutar y aislar un test que falla

```powershell
# Salida detallada, un test por línea
flutter test test/unit/core_test.dart -r expanded

# Filtrar por nombre (texto literal o regex)
flutter test --plain-name "refresh fallido cierra sesión"
flutter test --name "Login.*401"

# Detener en el primer fallo
flutter test --fail-fast

# Arrancar pausado para conectar el depurador / DevTools
flutter test test/unit/session_test.dart --start-paused
```

En VS Code también se puede usar **Run | Debug** sobre cada `test()` /
`testWidgets()` y poner breakpoints directamente.

### Técnicas útiles dentro de un test

| Técnica | Dónde verla en el proyecto |
|---------|---------------------------|
| Controlar el tiempo con `tester.pump(Duration)` | [screens_test.dart:346](../test/integration/screens_test.dart#L346) (debounce de 500 ms) |
| Simular respuestas lentas con `Completer` | [session_test.dart:103](../test/unit/session_test.dart#L103), [forms_test.dart:36](../test/unit/forms_test.dart#L36) |
| Espiar peticiones reales con un `InterceptorsWrapper` | [screens_test.dart:266](../test/integration/screens_test.dart#L266) |
| Verificar llamadas a mocks (`verify`, `verifyZeroInteractions`) | [forms_test.dart:32](../test/unit/forms_test.dart#L32), [storage_test.dart:26](../test/unit/storage_test.dart#L26) |
| Imprimir el árbol de widgets | llamar `debugDumpApp()` dentro de un `testWidgets` |

### Depurar la app conectada en ejecución

```powershell
flutter run --dart-define-from-file=env/dev.json   # luego: r = hot reload, R = hot restart
flutter pub global activate devtools; dart devtools # pestaña Network: ver peticiones Dio
flutter logs                                       # logs del dispositivo
maestro studio                                     # inspeccionar la UI para escribir flujos
```

`env/dev.json` apunta a `http://10.0.2.2:8080`, que es el `localhost` del PC visto
desde el emulador Android.

---

## 9. Monitoreo: qué hay hoy y qué falta

**Lo que ya existe y está probado:**

- Todos los errores de red pasan por un único punto
  ([api_call.dart](../lib/core/network/api_call.dart)) que los clasifica en
  `ApiError` (4xx con mensaje del backend) o `ServerError` (5xx, timeouts,
  contrato roto). Ver tests en la sección 2.2.
- El [AuthInterceptor](../lib/core/network/auth_interceptor.dart) renueva el
  token y cierra la sesión si el refresh falla.
- La UI muestra errores con opción de **Reintentar** (sección 4).
- CI publica el reporte de cobertura en cada push a `main`.

**Lo que aún no tiene el proyecto** (posibles mejoras para discutir en clase):

- Logging de peticiones HTTP en desarrollo (p. ej. `LogInterceptor` de Dio).
- Reporte de errores/crashes en producción (Firebase Crashlytics, Sentry).
- Captura global de errores con `FlutterError.onError` y
  `PlatformDispatcher.instance.onError`.

---

## 10. Resumen de comandos

| Qué quiero correr | Comando |
|-------------------|---------|
| Todo lo que no necesita dispositivo (tipos 1–4) | `flutter test` |
| Solo unitarias | `flutter test test/unit` |
| Solo widget | `flutter test test/widget_test.dart` |
| Solo integración de pantallas | `flutter test test/integration` |
| Integración nativa | `flutter test integration_test/smoke_test.dart -d <id> --dart-define-from-file=env/dev.json` |
| E2E Maestro | `maestro test -e E2E_EMAIL=... -e E2E_PASSWORD=... .maestro/flows` |
| Con cobertura | `flutter test --coverage` |
| Un test por nombre | `flutter test --plain-name "texto del test"` |
| Formato | `dart format --output=none --set-exit-if-changed lib test integration_test` |
| Análisis estático | `flutter analyze` |
