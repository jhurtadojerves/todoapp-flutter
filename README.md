# TodoApp Flutter

Migración de la aplicación React Native/Expo situada en `../todoapp` a Flutter.
Android es la plataforma principal; iOS queda configurado para compilar en macOS.

## Documentación para continuar

- [Avances y pendientes](AVANCES_MIGRACION.md): estado real, verificaciones y relevo.
- [Plan original](PLAN_MIGRACION_FLUTTER.md): alcance y criterios de aceptación.
- [Build, dispositivos y firma](BUILD_APK.md): desarrollo y distribución.

## Arranque

```powershell
flutter pub get
dart run build_runner build
flutter run --dart-define-from-file=env/dev.json
```

El backend Django local debe estar en el puerto 8080. No hay credenciales
incluidas. La URL de producción es un marcador y debe configurarse.

## Arquitectura

`core/`: red, errores, configuración, almacenamiento y servicios de dispositivo.
`domain/`: modelos inmutables, repositorios y casos de uso.
`data/`: datasources remotos/locales e implementaciones de repositorio.
`presentation/`: providers Riverpod, listas paginadas, pantallas y widgets.
`app/`: router y tema Material 3.

Los modelos Freezed están agrupados en `lib/domain/models/models.dart`; los
archivos generados se conservan en el proyecto. Tras modificar contratos,
ejecutar build_runner. JSON remoto usa snake_case; el índice de adjuntos local
usa camelCase para conservar el formato del proyecto original.

## Verificación

```powershell
dart format lib test
flutter analyze
flutter test --coverage
```

La suite sustituye red, almacenamiento y servicios de cámara/GPS. Para comprobar
permisos reales hacen falta dispositivo o emulador. Consultar el registro antes
de asumir que la migración tiene paridad completa con los 411 tests originales.
