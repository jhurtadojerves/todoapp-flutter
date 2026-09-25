# Avances de la migración Flutter

Última actualización: 2026-09-23.

## Objetivo y referencias

Ejecutar `MIGRATION_PLAN.md`. La aplicación original está en
`../todoapp` (React Native/Expo); usar sus modelos, datasources, textos y pruebas
como referencia. No modificar ese proyecto durante la migración.

El usuario autorizó crear/editar archivos e instalar dependencias en este
proyecto. También solicitó este registro para facilitar el relevo.

## Estado real

La migración **está en curso**. Todavía no hay paridad funcional ni APK validado.

### Implementado

- Scaffold Flutter con Android e iOS, organización `com.jhurtadojerves`,
  applicationId `com.jhurtadojerves.todoapp_flutter`.
- Dependencias runtime del plan instaladas; generadores, mocks, herramientas
  de iconos/splash instaladas. Versiones exactas en `pubspec.lock`.
- `lib/core/config/api_config.dart`: validación HTTPS y excepciones HTTP locales.
- `lib/core/network/api_exception.dart`: cuatro familias de errores en español.
- `lib/core/network/api_call.dart`: traducción de errores Dio y errores de contrato.
- `lib/core/storage/secure_storage.dart`: interfaz sustituible y almacenamiento
  seguro de ambos tokens; limpieza de sesiones incompletas.
- `lib/core/utils/jwt.dart`: extracción tolerante de `user_id`.
- `lib/app/theme.dart`: base Material 3.
- `env/dev.json` y `env/prod.json`.

### Verificaciones ejecutadas

- `flutter --version`: Flutter 3.44.5, Dart 3.12.2.
- `flutter create --org com.jhurtadojerves --project-name todoapp_flutter --platforms android,ios .`: correcto.
- `flutter pub add ...` runtime y dev: resolución correcta.
- Aún **no** se ejecutaron análisis, pruebas ni compilación después de añadir core.
- La pantalla principal y el widget test siguen siendo los del scaffold.

## Próximos pasos

1. Terminar fase 0: permisos Android/iOS, seguridad de red, iconos/splash,
   navegación base con tres pestañas y prueba de arranque.
2. Modelos serializados con validación, interfaces, datasources, repositorios
   y casos de uso equivalentes a RN.
3. Sesión Riverpod, refresh concurrente unificado, interceptor y autenticación.
4. Tableros, miembros, estados y sprints; tareas y comentarios.
5. Adjuntos locales con cámara/GPS y permisos sustituibles en pruebas.
6. Usuarios, pulido, pruebas unitarias/integración, Maestro y CI.
7. Compilación Android, firma de distribución y documentación de build.

## Decisiones y precauciones para continuar

- `env/prod.json` contiene **un dominio de ejemplo**, no una API configurada.
  Sustituir por la URL real antes de probar producción o distribuir.
- No hay repositorio Git inicializado en esta carpeta; el proyecto RN vecino
  tiene su propio repositorio. No se hicieron commits.
- Los comandos Flutter sin acceso a la caché del SDK quedaron sin salida en
  el entorno restringido. Ejecutados con acceso ampliado terminaron bien.
  SDK ubicado en `C:/Users/USER/flutter`.
- Android Studio no es necesario para editar ni ejecutar pruebas unitarias.
  Hace falta emulador o dispositivo para validar cámara/GPS y el flujo real.
- iOS se configura aquí, pero su compilación exige macOS.
- No se ha comprobado disponibilidad del backend ni credenciales de prueba.
- Comprobar el formato real en `../todoapp/src/domain/models/*.ts`:
  JSON remoto snake_case; dominio camelCase; relaciones de tarea nullable.
- No marcar fases completas solo porque existan archivos: el plan exige
  análisis limpio, pruebas y criterios funcionales específicos.

## Comandos de continuidad

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart format lib test
flutter analyze
flutter test
flutter run --dart-define-from-file=env/dev.json
```

El comando build_runner será útil cuando se incorporen modelos/proveedores
generados. Actualizar este documento tras cada bloque implementado y verificado,
incluyendo fallos pendientes y comandos de comprobación.

## Actualización: primer conjunto funcional escrito

- Modelos Freezed/JSON para recursos remotos y adjuntos locales, con JSON snake_case
  remoto y camelCase en el índice local. Generación ejecutada; comentarios añadidos
  en una segunda generación.
- Repositorios, datasources y casos de uso CRUD para siete recursos.
- Sesión AsyncNotifier, almacenamiento sustituible, refresh compartido y
  reintento con Dio separado para evitar bloqueo del interceptor encolado.
- Router con pestañas persistentes, AuthGate, rutas de detalle y fallback atrás.
- Pantallas: login/registro (debounce), usuarios, tableros, tareas, formularios,
  secciones inline de miembros/estados/sprints/comentarios.
- Paginación con error de carga adicional sin perder elementos ya cargados.
- Adjuntos: índice local, copia de foto, operaciones serializadas, servicios
  de cámara/GPS/permisos sustituibles y estados de permiso denegado/bloqueado.
- Manifest Android con permisos y seguridad HTTP restringida.
- Reemplazado el contador de ejemplo y su test por app y prueba de AuthGate.

**Validación en curso:** primer `flutter analyze`; todavía no declarar esta
implementación compilada ni funcional contra backend real. Pendientes inmediatos:
corregir análisis, completar configuración iOS/iconos, probar red/sesión/permisos,
CI y build. Los formularios tienen estado local StatefulWidget; extraer sus
viewmodels para cerrar la correspondencia arquitectónica completa del plan.

## Actualización: primeras verificaciones completadas

- `flutter test --coverage`: **46 pruebas aprobadas** (core, sesión,
  refresh concurrente, adjuntos y widget de arranque).
- Los cuatro casos de permisos previstos tienen pruebas: cámara denegada,
  cámara bloqueada, GPS denegado, GPS bloqueado. Son simulaciones; falta
  comprobar el comportamiento del sistema operativo en un dispositivo.
- Iconos y splash generados correctamente desde recursos RN.
- Info.plist actualizado. La versión instalada de permission_handler detecta
  los permisos desde Info.plist cuando se usa Swift Package Manager.
- Maestro copiado y appId adaptado; no ejecutado todavía.
- `flutter build apk --debug --dart-define-from-file=env/dev.json`: en curso.
- Análisis inicial: sin errores de tipos; 50 advertencias/infos. Se limpiaron
  imports y se documentó la excepción de anotaciones Freezed. Falta repetir
  análisis tras las últimas pruebas.

## Actualización: APK debug generado y pantallas verificadas

- APK generado: `build/app/outputs/flutter-apk/app-debug.apk`.
- `flutter build apk --debug --dart-define-from-file=env/dev.json`: correcto.
- Se fijó `permission_handler: ^12.0.1` (Android 13.0.1). La versión 13.0.2
  del paquete principal requería android-37, mientras el SDK descargaba 37.0;
  esa incompatibilidad bloqueaba Gradle. La versión compatible compiló bien.
- Seis tests de integración de pantallas aprobados: login correcto, login 401,
  paginación, contrato roto, creación de tablero con lista actualizada y debounce.
- Se añadieron README, BUILD_APK, ejemplo de key.properties y workflow CI.
- Firma release configurada sin fallback a clave debug. Falta URL de producción
  y clave de firma; no se ha generado ni distribuido APK release.
- No hay prueba E2E contra backend real todavía. Se preguntó si se usará Django
  local en puerto 8080; respuesta pendiente al escribir esta actualización.

## Actualización: pruebas nativas y arquitectura

- `flutter test --coverage`: **124 pruebas aprobadas** antes de la última
  extracción de formularios. Incluyen matrices de rutas, query params y cuerpos
  JSON de los siete recursos a través de casos de uso/repositorio/datasource.
- Emulador existente `Medium_Phone_API_36.1` iniciado (emulator-5554).
- `flutter test integration_test/smoke_test.dart -d emulator-5554 --dart-define-from-file=env/dev.json`:
  **1 prueba nativa aprobada** (Home, Boards protegido, registro y regreso).
- El APK de salida queda sobrescrito por el runner de integración al ejecutar
  esa prueba; volver a compilar `lib/main.dart` antes de entregar el APK normal.
- La prueba HTTP local a `127.0.0.1:8080/api/v1/users/` no pudo conectar.
- Los **33 casos de uso** del plan ya existen. Las listas/secciones usan
  providers de casos de uso. Se añadieron repo/casos de uso de adjuntos y auth.
- Viewmodels generados Riverpod para BoardForm, TaskForm y AuthForm;
  quedan pendientes de la nueva corrida de análisis/tests tras extraerlos.
- Se configuró el esquema de deep links `todoapp:///board/ID` en Android/iOS.
- Pruebas de modelos y formularios añadidas, pendientes de ejecutar en este punto.

## Actualización 2026-09-25: versionado, CI y distribución

- Proyecto versionado y publicado en https://github.com/jhurtadojerves/todoapp-flutter
  (público, rama `main`). CI `flutter.yml` ejecutado en GitHub: aprobado.
- `env/prod.json` apunta a `https://todoapp.juliens.dev`; la API responde.
- Keystore de firma generado fuera del repositorio; secrets de firma en GitHub.
- Build release local correcto tras añadir `includeSubdomains="false"` en
  `network_security_config.xml` (lint fatal de release).
- Nuevo workflow `release-apk.yml`: al publicar un release compila, firma y
  adjunta el APK. Release v1.0.0 creado; `todoapp-v1.0.0.apk` adjunto.
- `flutter.yml` limitado a push a `main` y pull requests, para no repetirse
  con el push del tag al crear un release.
- Guía de pruebas para la clase en `docs/TESTING_GUIDE.md`.
- Documentos de migración movidos a `docs/migration/`.
