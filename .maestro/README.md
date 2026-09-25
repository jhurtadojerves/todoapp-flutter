# Flujos Maestro de TodoApp Flutter

Requieren APK instalado, emulador/dispositivo Android y backend de pruebas.
El appId ya está adaptado a `com.jhurtadojerves.todoapp_flutter`.

```powershell
maestro test -e E2E_EMAIL=cuenta-de-pruebas -e E2E_PASSWORD=clave-de-pruebas .maestro/flows
```

- `01-login-invalid.yaml`: muestra el error de credenciales de Django.
- `02-board-task-lifecycle.yaml`: crea y elimina un tablero y una tarea.
- `03-logout.yaml`: comprueba que las pestañas vuelven a pedir login.

No guardar credenciales en los YAML. Estos flujos se adaptaron desde la app RN;
consultar `../docs/migration/MIGRATION_PROGRESS.md` para conocer cuáles se han ejecutado realmente.

Prueba nativa sin backend:

```powershell
flutter test integration_test/smoke_test.dart -d emulator-5554 --dart-define-from-file=env/dev.json
```
