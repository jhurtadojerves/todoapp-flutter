# Compilación de publicación en local — paso a paso

Cómo pasar de "funciona con `flutter run`" a un **APK y un AAB firmados, ofuscados
y verificados**, generados en tu propio equipo. Es el mismo resultado que produce
el workflow [`release-apk.yml`](../.github/workflows/release-apk.yml) en GitHub,
pero sin depender de él.

> **Esta guía trabaja en una carpeta de práctica aislada**, al mismo nivel que
> tu copia de trabajo del proyecto. Allí se crean un clon nuevo del repositorio,
> una clave de práctica y su `key.properties`. No toca tu copia de trabajo, tu
> `android/key.properties` ni la clave real de la app. Al terminar se borra la
> carpeta y no queda nada. Como la clave es de práctica, sus contraseñas se
> pueden mostrar en pantalla.

```
todoapp-mobile\                      ← carpeta contenedora
├── flutter\                         ← tu copia de trabajo (NO se toca)
├── practica-release-prueba\         ← $P de una práctica
│   ├── keys\
│   │   └── practica-upload.jks      ← clave de PRÁCTICA (paso 1)
│   └── todoapp-flutter\             ← clon nuevo del repositorio (paso 0)
│       ├── android\key.properties   ← apunta a la clave de práctica (paso 2)
│       └── dist\<versión>\          ← APK, AAB y símbolos (paso 5)
├── practica-release-paralelo-a\     ← otra práctica, misma estructura
└── practica-release-paralelo-b\
```

**Antes de empezar, en cada ventana de PowerShell nueva**, define la carpeta de
práctica. Todos los comandos de la guía usan `$P`, así que cada práctica tiene
su propia carpeta:

```powershell
$P = "$HOME\Projects\todoapp-mobile\practica-release-prueba"
$env:Path += ";C:\Program Files\Android\Android Studio\jbr\bin"   # para keytool
```

**Si la carpeta ya está preparada** (ya tiene `keys\` y el clon), salta el
paso 0. Abre PowerShell, ejecuta este bloque cambiando solo la primera línea y
continúa en el [paso 1](#1-crear-la-clave-de-firma-keystore):

```powershell
$P = "$HOME\Projects\todoapp-mobile\practica-release-prueba"   # o -paralelo-a / -paralelo-b
$env:Path += ";C:\Program Files\Android\Android Studio\jbr\bin"
Set-Location "$P\todoapp-flutter"
git pull                               # trae la última versión del repositorio
```

Todos los comandos son de **PowerShell**.

| Paso | Qué produce |
|---|---|
| [0. Preparar la carpeta](#0-preparar-la-carpeta-de-práctica) | Entorno verificado y clon limpio |
| [1. Clave de firma](#1-crear-la-clave-de-firma-keystore) | `practica-upload.jks` |
| [2. `key.properties`](#2-conectar-la-clave-con-gradle) | Gradle sabe cómo firmar |
| [3. Configuración de producción](#3-revisar-la-configuración-de-producción) | Lista de verificación |
| [4. Versión](#4-declarar-la-versión) | `version: x.y.z+n` |
| [5. Compilar](#5-compilar) | APK, AAB y símbolos |
| [6. Verificar](#6-verificar-la-compilación-de-publicación) | Evidencia de que es la de publicación |
| [7. Limpiar](#7-limpiar) | Nada queda en el equipo |
| [Con la clave real](#con-la-clave-real) | Qué cambia al publicar de verdad |

---

## 0. Preparar la carpeta de práctica

**Herramientas:**

```powershell
flutter --version        # 3.44.5, canal stable
flutter doctor           # Android toolchain sin errores
```

Si `flutter doctor` muestra **`cmdline-tools component is missing`**, el APK
compila igual, pero el **AAB falla** con `failed to strip debug symbols from
native libraries`, porque Flutter usa `apkanalyzer`, que viene en ese paquete.
Para instalarlo: Android Studio → *Settings → Languages & Frameworks → Android
SDK → SDK Tools* → marcar **Android SDK Command-line Tools (latest)** → *Apply*.
También necesitas el **NDK** que pide Flutter (28.2.13676358 en 3.44.5). Va en
la misma pestaña y Gradle suele descargarlo solo.

`keytool` (para crear la clave) viene con el JDK de Android Studio, pero no suele
estar en el `PATH`. La línea `$env:Path += ...` del inicio lo agrega para esta
sesión:

```powershell
keytool -help            # debe responder
```

**Carpeta y clon nuevo.** Clonar desde GitHub reproduce lo que vive quien
recibe el proyecto: sin clave, sin `key.properties`, sin nada local.

```powershell
New-Item -ItemType Directory -Force "$P\keys" | Out-Null
git clone https://github.com/jhurtadojerves/todoapp-flutter.git "$P\todoapp-flutter"
Set-Location "$P\todoapp-flutter"
```

**A partir de aquí, todos los comandos se ejecutan dentro de
`$P\todoapp-flutter`.**

## 1. Crear la clave de firma (keystore)

La compilación de debug se firma sola con una clave genérica. La de publicación
necesita **una clave propia**, que es la identidad de la app: Android rechaza una
actualización firmada con otra clave.

```powershell
keytool -genkeypair -v `
  -keystore "$P\keys\practica-upload.jks" `
  -keyalg RSA -keysize 2048 -validity 10000 `
  -alias upload
```

Pide dos contraseñas (la del almacén y la de la clave), que no se ven al
escribirlas, y unos datos de identidad (nombre, organización, país).

- **No pongas las contraseñas en el comando** (`-storepass ...`): quedarían en el
  historial de PowerShell. Deja que `keytool` las pida.
- Si el archivo ya tiene una clave con ese alias, `keytool` **no la sobrescribe**:
  responde `el alias <upload> ya existe` y no cambia nada.

Con Google Play, esta es la **clave de subida**: la que firma lo que se instala la
custodia Google (Play App Signing).

## 2. Conectar la clave con Gradle

[`android/app/build.gradle.kts`](../android/app/build.gradle.kts) lee la firma
de `android/key.properties`. Si ese archivo falta, **el build release falla a
propósito** y no usa la clave de debug.

El bloque siguiente crea el archivo con la ruta de la clave ya escrita, pero
**solo si no existe**, y lo abre para completar las contraseñas:

```powershell
if (Test-Path android\key.properties) {
    Write-Host "Ya existe android\key.properties: no se sobrescribe." -ForegroundColor Yellow
} else {
    $ks = "$P\keys\practica-upload.jks" -replace '\\', '/'
    @"
storePassword=CAMBIAR
keyPassword=CAMBIAR
keyAlias=upload
storeFile=$ks
"@ | Set-Content android\key.properties
}
notepad android\key.properties
```

En el Bloc de notas, reemplaza los dos `CAMBIAR` por las contraseñas del paso 1 y
guarda. El resultado queda así:

```properties
storePassword=<contraseña del almacén>
keyPassword=<contraseña de la clave>
keyAlias=upload
storeFile=C:/Users/<usuario>/Projects/todoapp-mobile/practica-release-prueba/keys/practica-upload.jks
```

La ruta de `storeFile` usa `/`. Es la misma estructura que
[`android/key.properties.example`](../android/key.properties.example).

Comprueba que Git no subirá ni la clave ni sus contraseñas:

```powershell
git check-ignore -v android/key.properties   # debe imprimir la regla de .gitignore
git status --short                            # key.properties NO debe aparecer
```

## 3. Revisar la configuración de producción

| Qué verificar | Dónde | Estado en este proyecto |
|---|---|---|
| La API es el servidor desplegado, con HTTPS | [`env/prod.json`](../env/prod.json) | `https://todoapp.juliens.dev` |
| No apunta a `10.0.2.2` ni a una IP local | `env/prod.json` | Lo valida [`api_config.dart`](../lib/core/config/api_config.dart) al arrancar en release |
| Sin tráfico HTTP en release | [`main/res/xml/network_security_config.xml`](../android/app/src/main/res/xml/network_security_config.xml) | Solo HTTPS. La excepción para el emulador está en [`src/debug/`](../android/app/src/debug/res/xml/network_security_config.xml) |
| Sin registro detallado | `lib/core/network` | No hay `LogInterceptor` |
| Sin secretos en el código | `env/*.json`, `lib/` | Solo URL y timeout |
| `targetSdk` vigente | Flutter 3.44.5 | API 36 (Android 16) |
| Permisos solo los usados | [`AndroidManifest.xml`](../android/app/src/main/AndroidManifest.xml) | Internet, cámara, ubicación |

Comprueba antes que el backend responda, desde el navegador o con la herramienta
de pruebas de API: `https://todoapp.juliens.dev/api/docs/swagger/`.

## 4. Declarar la versión

En [`pubspec.yaml`](../pubspec.yaml):

```yaml
version: 1.0.1+2     # nombre de versión 1.0.1 · número de compilación 2
```

El **número de compilación** (después del `+`) debe **crecer en cada envío**: la
tienda rechaza uno que no supere al último. También se puede pasar sin editar el
archivo, con `--build-name=1.0.1 --build-number=2`.

> En CI el número de compilación es el número de ejecución del workflow, así que
> siempre crece. Si mezclas builds locales y de CI para Play, usa números que no
> choquen.

## 5. Compilar

### Opción A: script

```powershell
.\scripts\build-release.ps1                               # versión de pubspec.yaml
.\scripts\build-release.ps1 -BuildName 1.0.1 -BuildNumber 2
.\scripts\build-release.ps1 -SkipTests                    # sin analyze ni test
```

[`scripts/build-release.ps1`](../scripts/build-release.ps1) comprueba la firma,
ejecuta el análisis y los tests, compila APK y AAB ofuscados, verifica la firma y
deja todo en `dist/<versión>/`. Muestra la ruta del keystore y el alias, pero
nunca las contraseñas:

```
dist/1.0.0+1/
├── todoapp-1.0.0.apk     ← instalación directa
├── todoapp-1.0.0.aab     ← Google Play
└── symbols/              ← para leer trazas ofuscadas de ESTA versión
```

### Opción B: comandos a mano

```powershell
flutter pub get
dart run build_runner build
flutter analyze
flutter test

# APK: instalación directa, fuera de la tienda
flutter build apk --release --dart-define-from-file=env/prod.json `
  --obfuscate --split-debug-info=build/symbols
# → build\app\outputs\flutter-apk\app-release.apk

# AAB: el único formato que Google Play acepta para apps nuevas
flutter build appbundle --release --dart-define-from-file=env/prod.json `
  --obfuscate --split-debug-info=build/symbols
# → build\app\outputs\bundle\release\app-release.aab
```

**APK o AAB.** El AAB no se instala directamente: Play lo usa para generar un
APK a medida de cada dispositivo. Para pasarle la app a alguien sin tienda, usa
el APK.

**Ofuscación y símbolos.** `--obfuscate` cambia los nombres de clases y funciones
por identificadores sin sentido. Así las trazas de error también quedan
ofuscadas, y solo se leen con la carpeta de símbolos **de esa misma versión**:

```powershell
flutter symbolize -i traza.txt -d dist\1.0.0+1\symbols\app.android-arm64.symbols
```

En una versión real, guarda los símbolos de cada versión publicada. La
ofuscación **no** protege secretos: el binario se puede analizar igual.

## 6. Verificar la compilación de publicación

La compilación de publicación es otra aplicación: hay que probarla aparte, aunque
la de debug funcione.

**Firma.** El script lo hace solo. A mano:

```powershell
$bt = (Get-ChildItem "$env:LOCALAPPDATA\Android\Sdk\build-tools" | Sort-Object Name | Select-Object -Last 1).FullName
& "$bt\apksigner.bat" verify --print-certs dist\1.0.0+1\todoapp-1.0.0.apk
```

Debe mostrar el certificado de práctica (`CN=...` con los datos del paso 1),
**no** `CN=Android Debug`. Para el AAB:
`keytool -printcert -jarfile dist\1.0.0+1\todoapp-1.0.0.aab`. El certificado y
su huella son públicos: se pueden mostrar.

**Instalación en un emulador o teléfono:**

```powershell
adb devices                                   # el dispositivo aparece como "device"
adb install -r dist\1.0.0+1\todoapp-1.0.0.apk
```

Si el dispositivo ya tiene TodoApp firmada con otra clave (la de debug, o la
versión oficial del release), la instalación falla con
`INSTALL_FAILED_UPDATE_INCOMPATIBLE`: Android no acepta una actualización
firmada con otra identidad. Para continuar hay que desinstalar la que está, lo
que **borra sus datos locales**:

```powershell
adb uninstall com.jhurtadojerves.todoapp_flutter
adb install dist\1.0.0+1\todoapp-1.0.0.apk
```

**Recorrido obligatorio:**

- [ ] La cinta **DEBUG** no aparece en la esquina superior derecha.
- [ ] En un teléfono: usa **datos móviles**, no el WiFi del equipo de desarrollo.
- [ ] Iniciar sesión, crear un tablero y una tarea, comentar.
- [ ] Adjuntar una foto de evidencia y **denegar** el permiso de ubicación: la
      tarea se guarda igual.
- [ ] Cerrar sesión y volver a entrar.

> El login de producción admite 5 intentos por minuto. Tras varios fallos
> seguidos, espera un minuto.

### (Opcional) Probar el AAB sin Play

El AAB no se instala, pero `bundletool` (la herramienta que usa Play) puede
generar a partir de él los APK que Play entregaría. Pide la contraseña de la
clave por consola:

```powershell
# https://github.com/google/bundletool/releases → bundletool-all-<versión>.jar
java -jar bundletool.jar build-apks --bundle=dist\1.0.0+1\todoapp-1.0.0.aab `
  --output=build\todoapp.apks `
  --ks="$P\keys\practica-upload.jks" --ks-key-alias=upload
java -jar bundletool.jar install-apks --apks=build\todoapp.apks    # dispositivo conectado
```

## 7. Limpiar

```powershell
Set-Location C:\
Remove-Item -Recurse -Force $P
adb uninstall com.jhurtadojerves.todoapp_flutter    # si se instaló el APK de práctica
```

La clave de práctica no sirve para nada más: un APK firmado con ella no puede
actualizar la versión oficial, ni al revés.

---

## Con la clave real

Los pasos son los mismos. Cambia solo dónde viven la clave y el proyecto:

| | Práctica | Real |
|---|---|---|
| Proyecto | Clon en `$P\todoapp-flutter` | Tu copia de trabajo |
| Clave | `$P\keys\practica-upload.jks` | Fuera del proyecto, p. ej. `C:\secure\todoapp-upload.jks` |
| Se crea | Cada vez que se practica | **Una sola vez en la vida de la app** |
| Contraseñas | Se pueden mostrar | Nunca en pantalla, código, chat ni historial |
| Al terminar | Se borra todo | **Respaldo fuera del equipo** (gestor de contraseñas o USB cifrado) |

Tres reglas para la clave real:

1. El `.jks` **nunca** entra al repositorio. `.gitignore` excluye `*.jks`,
   `*.keystore` y `android/key.properties`.
2. Las contraseñas **no** van en el código ni en archivos versionados.
3. **Respaldo fuera del equipo.** Si se pierde, no hay actualizaciones fuera de
   Play. Con Play App Signing se puede pedir el restablecimiento de la clave de
   subida, pero es un trámite, no un derecho automático.

En CI la clave real llega como *secret* de GitHub (ver
[BUILD_APK.md](../BUILD_APK.md#apk-y-aab-automáticos-en-releases)).

---

## Problemas frecuentes

| Síntoma | Causa | Solución |
|---|---|---|
| `Falta android/key.properties` | No se hizo el paso 2 | Crear el archivo |
| AAB: `failed to strip debug symbols from native libraries` | Faltan las cmdline-tools del SDK | Instalarlas (paso 0) |
| `Keystore was tampered with, or password was incorrect` | Contraseña equivocada en `key.properties` | Revisar `storePassword` |
| `el alias <upload> ya existe` | El `.jks` ya tiene esa clave | Usar la existente o otro archivo |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Hay una versión instalada firmada con otra clave | `adb uninstall com.jhurtadojerves.todoapp_flutter` y reinstalar |
| La app abre pero no carga datos | Se compiló sin `--dart-define-from-file=env/prod.json` o con `env/dev.json` | Recompilar con `env/prod.json` |
| Aparece la cinta DEBUG | Se instaló `app-debug.apk` | Instalar el de `dist/` o `app-release.apk` |
| La primera petición tarda o expira | El backend estaba inactivo | Abrir Swagger antes de la demo |
| Play rechaza el AAB por versión | El número de compilación no creció | Subir el número después del `+` |
