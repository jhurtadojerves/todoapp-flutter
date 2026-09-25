# Avances de la migración Flutter

Última actualización: **2026-09-25**.

## Estado para retomar

La implementación principal está escrita, versionada en GitHub y distribuida:
el release **v1.0.0** incluye un APK firmado que apunta a producción.
**No declarar cerrada la migración completa:** faltan la validación funcional
contra Django real, la comprobación física de cámara/GPS, la equivalencia
exhaustiva con la suite RN y la compilación iOS.

- Repositorio: https://github.com/jhurtadojerves/todoapp-flutter (público, rama `main`).
- Release: https://github.com/jhurtadojerves/todoapp-flutter/releases/tag/v1.0.0

Referencia de alcance: [MIGRATION_PLAN.md](MIGRATION_PLAN.md).
Aplicación original: `../todoapp` (relativo a la raíz del proyecto Flutter). No se modificó ese proyecto.
Historial de trabajo: [MIGRATION_HISTORY.md](MIGRATION_HISTORY.md).
Guía de pruebas: [docs/TESTING_GUIDE.md](../TESTING_GUIDE.md).

## Implementado

| Área | Implementación |
| --- | --- |
| Proyecto | Flutter Android/iOS; `com.jhurtadojerves.todoapp_flutter`; Material 3; iconos y splash originales. |
| Navegación | Home, Boards y Users con StatefulShellRoute; AuthGate; rutas de tableros/tareas; atrás con fallback; esquema `todoapp:///board/ID`. |
| Core | Dio, cuatro familias de error en español, validación de contrato, configuración HTTPS, JWT y almacenamiento seguro sustituible. |
| Dominio/datos | Modelos Freezed/JSON; nueve interfaces de repositorio; datasources e implementaciones; los 33 casos de uso. |
| Autenticación | Restauración de ambos tokens; login; registro + login; validación de contraseña con debounce; logout; refresh compartido y un reintento; redirección tras sesión expirada. |
| Tableros | Listado paginado, crear/editar/eliminar, detalle y controles de owner. |
| Secciones | Miembros (invitar/quitar), estados y sprints con CRUD inline y paginación; fechas validadas. |
| Tareas | Lista, filtro por estado, detalle, crear/editar/eliminar; opciones completas de chips cargadas en paralelo. |
| Comentarios | Listado paginado y CRUD; edición/eliminación para autor u owner. |
| Adjuntos | Cámara/GPS mediante interfaces sustituibles; permisos denegados/bloqueados; enlaces a ajustes; copia de fotos e índice local. |
| Estado | AsyncNotifier para sesión/listas/adjuntos; Notifiers generados para AuthForm, BoardForm y TaskForm. |
| Pruebas/CI | Unitarias, contratos, pipelines de recursos, widgets e integración nativa; Maestro adaptado; workflow `flutter.yml` (formato/análisis/tests/cobertura) en push a `main` y pull requests. |
| Distribución | Firma release por key.properties, sin fallback debug. Workflow `release-apk.yml`: al publicar un release compila el APK firmado con `env/prod.json` y lo adjunta al release. Firma en GitHub Secrets. |

Las mutaciones invalidan listas, detalles y opciones relacionadas. La paginación
conserva elementos ante fallos de “Cargar más” y descarta respuestas anteriores
a una recarga. Las escrituras de sesión y adjuntos están serializadas.

## Verificaciones y evidencia

- SDK comprobado: **Flutter 3.44.5 / Dart 3.12.2**.
- `flutter analyze`: **sin incidencias** en la ejecución final del 2026-09-24.
- `dart format --output=none --set-exit-if-changed lib test integration_test`: **110 archivos comprobados, 0 cambios**.
- `flutter test --coverage`: **144 pruebas aprobadas** en la corrida conjunta final; incluye **7 pruebas de pantalla**.
- Cobertura de líneas sin archivos generados: **1179/1732 (68,1 %)**; datos en `coverage/lcov.info`.
- Se comprobó desde la pantalla de tarea que los chips envían `status_id`,
  `sprint_id` y el **id de usuario**, no el id de membresía, en `assigned_to_id`.
- `flutter build apk --debug --dart-define-from-file=env/dev.json`: **compilación final correcta** (2026-09-24), desde `lib/main.dart`. APK normal: `build/app/outputs/flutter-apk/app-debug.apk`.
- `integration_test/smoke_test.dart`: **1 prueba nativa aprobada** en Android 16,
  emulador `Medium_Phone_API_36.1`: Home, Boards protegido, registro y regreso.
- Al intentar repetir esa prueba tras las últimas refactorizaciones, el emulador
  ya no estaba conectado. Esa última repetición **no se ejecutó**.
- Maestro **no ejecutado**.
- iOS **no compilado**: requiere macOS.

### Verificaciones del 2026-09-25

- `flutter test` local: **144 pruebas aprobadas**.
- CI `flutter.yml` en GitHub Actions: **aprobado** (formato, análisis, tests, cobertura).
- API de producción `https://todoapp.juliens.dev/api/v1/`: responde; un login
  con credenciales falsas devuelve el 401 de Django esperado. No se probaron
  flujos autenticados.
- `flutter build apk --release --dart-define-from-file=env/prod.json` local:
  **correcto**; `apksigner` confirma firma `CN=Julio Hurtado, O=TodoApp`.
  Requirió añadir `includeSubdomains="false"` en `network_security_config.xml`
  (lint fatal de release).
- Workflow `release-apk.yml` con el release v1.0.0: **aprobado** (~6 min);
  `todoapp-v1.0.0.apk` (52 MB) adjunto al release. El APK **no se instaló ni
  probó** todavía en un dispositivo.

**Importante:** integration_test sobrescribe app-debug.apk con su runner.
La última compilación registrada arriba ya restableció el APK normal de la app.

## Próximos pasos concretos

1. Confirmar Django de pruebas y su URL. `env/dev.json` usa
   `http://10.0.2.2:8080`; la comprobación a `127.0.0.1:8080` falló. Producción
   (`https://todoapp.juliens.dev`) responde, pero Maestro crea y borra datos:
   **no ejecutarlo contra producción** sin una cuenta dedicada.
2. Conectar emulador/teléfono, repetir smoke nativo con el código final e
   instalar `todoapp-v1.0.0.apk` del release para probarlo contra producción.
3. Ejecutar el flujo real de registro/login, restauración tras reinicio,
   refresh por access vencido y CRUD completo con una cuenta de pruebas.
4. Ejecutar Maestro; comprobar permisos reales de cámara y GPS, ajustes,
   foto sin coordenadas y persistencia después de reiniciar.
5. Comparar sistemáticamente los casos restantes de los 411 tests RN.
   La suite Flutter cubre los riesgos principales, pero **no es una traducción
   uno a uno de los 53 archivos de domain/data ni una equivalencia demostrada
   de las 411 pruebas**. Faltan más escenarios de edición, permisos por rol,
   reintentos y recuperación de errores a nivel de pantalla.
6. Compilar/verificar iOS en macOS.

Resuelto el 2026-09-25: URL de producción en `env/prod.json`, firma local y en
CI, compilación release, versionado en GitHub y ejecución del CI.

## Decisiones que debe conocer quien continúe

- `permission_handler` fijado a **^12.0.1**. La versión 13.0.2 requería
  android-37 mientras el SDK instalaba android-37.0, bloqueando Gradle.
  Con 12.0.1, el build Android pasó. No subirlo sin comprobar esa compatibilidad.
- Versiones exactas en `pubspec.lock`. Conservarlo.
- Modelos agrupados en `lib/domain/models/models.dart`; se conservan los
  archivos generados. Los casos de uso/repositorios/datasources sí están
  separados por recurso/caso. Los tests de pipeline prueban varias capas juntas.
- Los controllers de texto y la apertura de editores inline viven en widgets;
  el envío de formularios principales, validación de contraseña y estado de
  negocio viven en viewmodels. No todos los editores inline tienen notifier propio.
- JSON remoto snake_case; índice local camelCase, compatible en estructura con RN.
- Refresh usa Dio separado y el reintento evita el interceptor encolado para
  impedir deadlocks. Se reutiliza el token renovado por peticiones anteriores.
- HTTP solo para 10.0.2.2, localhost y 127.0.0.1 en desarrollo. En un teléfono
  USB usar `adb reverse` + loopback; una IP LAN HTTP queda rechazada.
- Proyecto versionado en https://github.com/jhurtadojerves/todoapp-flutter.
  No hay cambios en repositorios vecinos.
- El usuario autorizó crear/editar archivos e instalar dependencias aquí.
  Flutter requirió acceso ampliado a su caché externa (`C:/Users/USER/flutter`).
- `env/prod.json` (`https://todoapp.juliens.dev`) vive en el repositorio: no es
  secreto, porque todo `--dart-define` queda embebido en el APK.
- Firma: keystore en `C:\secure\todoapp-upload.jks` (alias `upload`) y
  contraseña en `C:\secure\todoapp-upload-credenciales.txt`, fuera del repositorio;
  `android/key.properties` local está ignorado por Git. En GitHub Secrets:
  `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_PASSWORD`, `KEY_ALIAS`.
  **Perder la clave impide publicar actualizaciones del paquete.**
- Versionado de releases: el tag `vX.Y.Z` define `versionName`; el número de
  ejecución del workflow define `versionCode`.
- `flutter.yml` se dispara solo en push a `main` y en pull requests (no en tags),
  para no duplicar la validación al crear un release.
- No hay credenciales de pruebas incluidas.

## Comandos de continuidad

```powershell
flutter pub get
dart run build_runner build
dart format lib test integration_test
flutter analyze
flutter test --coverage
flutter emulators
flutter run --dart-define-from-file=env/dev.json
flutter test integration_test/smoke_test.dart -d emulator-5554 --dart-define-from-file=env/dev.json
flutter build apk --debug --dart-define-from-file=env/dev.json
flutter build apk --release --dart-define-from-file=env/prod.json
gh release create vX.Y.Z --title "vX.Y.Z" --generate-notes   # dispara el APK en CI
```

Ver [BUILD_APK.md](../../BUILD_APK.md) para firma, dispositivos e iOS.
Actualizar este documento tras cada bloque de trabajo y verificación.


