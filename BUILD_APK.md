# Compilación Android

## Desarrollo

Requisitos: Flutter 3.44.5, Dart 3.12.2, Android SDK y JDK de Android Studio.
Las versiones resueltas están fijadas en `pubspec.lock`.

```powershell
flutter pub get
dart run build_runner build
flutter analyze
flutter test --coverage
flutter build apk --debug --dart-define-from-file=env/dev.json
```

APK: `build/app/outputs/flutter-apk/app-debug.apk`.
Instalación con dispositivo o emulador conectado: `flutter install --debug`.
Para ejecutar con logs: `flutter run --dart-define-from-file=env/dev.json`.

`env/dev.json` conecta a `http://10.0.2.2:8080`, dirección del host desde el
emulador Android. El backend debe estar activo en el puerto 8080.
En un teléfono USB, usar `adb reverse tcp:8080 tcp:8080` y un archivo local
`env/dev-device.json` con `API_BASE_URL=http://127.0.0.1:8080`.
HTTP por IP LAN no está permitido; para conexión LAN utilizar HTTPS.

## Producción y firma

**`env/prod.json` contiene `https://api.example.com` como marcador. Sustituirlo
por la URL real antes de compilar para distribución. No contiene secretos.**

Configurar un keystore propio y copiar `android/key.properties.example` a
`android/key.properties`, rellenándolo localmente. Nunca versionar keystore,
contraseñas ni `key.properties`. Mantener una copia segura de la clave: será
necesaria para publicar actualizaciones del mismo paquete.

```powershell
flutter build apk --release --dart-define-from-file=env/prod.json
```

La compilación release exige `key.properties` y nunca usa la clave debug como
fallback. La app rechaza HTTP en release al arrancar. APK de salida:
`build/app/outputs/flutter-apk/app-release.apk`.

## iOS

Compilar desde macOS con Xcode. Cámara y ubicación están declaradas en
`ios/Runner/Info.plist`; no se solicita acceso permanente a ubicación.
El proyecto usa Swift Package Manager; el plugin Apple de permisos detecta
las descripciones del Info.plist. Si se cambia a CocoaPods, habilitar
`PERMISSION_CAMERA=1` y `PERMISSION_LOCATION_WHENINUSE=1` en el post_install.
Ejecutar `flutter build ios --dart-define-from-file=env/prod.json` y configurar
el equipo/firma de Apple. Este build no puede verificarse en Windows.

## Generación de recursos y pruebas E2E

```powershell
dart run flutter_launcher_icons
dart run flutter_native_splash:create
maestro test -e E2E_EMAIL=cuenta-de-pruebas -e E2E_PASSWORD=clave-de-pruebas .maestro/flows
```

Maestro requiere una cuenta y backend de pruebas. Sus flujos crean y eliminan
un tablero y una tarea. No ejecutar contra datos de producción.
Los recursos gráficos provienen de `../todoapp/assets/images`.
