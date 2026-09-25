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

`env/prod.json` apunta a la API de producción `https://todoapp.juliens.dev`.
No contiene secretos.

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

## APK automático en releases

El workflow [release-apk.yml](.github/workflows/release-apk.yml) se ejecuta al
publicar un release en GitHub: corre análisis y tests, compila el APK firmado con
`env/prod.json` y lo adjunta al release como `todoapp-<tag>.apk`. El tag define
`versionName` (`v1.2.0` → `1.2.0`) y el número de ejecución define `versionCode`.
También puede lanzarse a mano desde la pestaña Actions (el APK queda como
artefacto del run).

Secrets necesarios (Settings → Secrets and variables → Actions), creados una vez
con el mismo keystore que se usa localmente:

```powershell
$gh = "C:\Program Files\GitHub CLI\gh.exe"
[Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\secure\todoapp-upload.jks")) | & $gh secret set KEYSTORE_BASE64
& $gh secret set KEYSTORE_PASSWORD   # pide el valor por consola
& $gh secret set KEY_PASSWORD
& $gh secret set KEY_ALIAS --body upload
```

Publicar una versión:

```powershell
& $gh release create v1.0.0 --title "v1.0.0" --generate-notes
```

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
