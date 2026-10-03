<#
.SYNOPSIS
  Compila localmente el APK y el AAB de publicación, firmados y ofuscados.

.DESCRIPTION
  Hace lo mismo que .github/workflows/release-apk.yml, pero en tu equipo:
    1. Comprueba que existen android/key.properties y el keystore.
    2. (Opcional) analiza y ejecuta los tests.
    3. Compila APK y AAB con env/prod.json, --obfuscate y --split-debug-info.
    4. Copia todo a dist/<versión>/ junto con los símbolos de esa versión.
    5. Verifica la firma del APK e imprime el certificado.

  La versión sale de pubspec.yaml (version: 1.2.0+7) salvo que se pase
  -BuildName / -BuildNumber. Recuerda: el número de compilación debe crecer en
  cada envío a la tienda.

.EXAMPLE
  .\scripts\build-release.ps1
  .\scripts\build-release.ps1 -BuildName 1.0.1 -BuildNumber 2
  .\scripts\build-release.ps1 -SkipTests
#>
param(
    [string]$BuildName,
    [string]$BuildNumber,
    [switch]$SkipTests
)

$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)

function Step($text) { Write-Host "`n==> $text" -ForegroundColor Cyan }
function Fail($text) { Write-Host "ERROR: $text" -ForegroundColor Red; exit 1 }
function Run { & $args[0] $args[1..($args.Length - 1)]; if ($LASTEXITCODE -ne 0) { Fail "$($args -join ' ') terminó con código $LASTEXITCODE" } }

# --- 1. Firma ----------------------------------------------------------------
Step 'Comprobando la configuración de firma'
$keyProps = 'android/key.properties'
if (-not (Test-Path $keyProps)) {
    Fail "Falta $keyProps. Copia android/key.properties.example y sigue docs/RELEASE_LOCAL.md (paso 2)."
}
$props = @{}
Get-Content $keyProps | Where-Object { $_ -match '^\s*([^#=]+?)\s*=\s*(.*)$' } |
    ForEach-Object { $props[$Matches[1]] = $Matches[2] }
foreach ($k in 'storeFile', 'storePassword', 'keyPassword', 'keyAlias') {
    if (-not $props[$k] -or $props[$k] -eq 'REPLACE_LOCALLY') { Fail "$keyProps no define '$k'." }
}
if (-not (Test-Path $props.storeFile)) { Fail "No existe el keystore: $($props.storeFile)" }
Write-Host "Keystore: $($props.storeFile)  alias: $($props.keyAlias)"

# --- Versión -----------------------------------------------------------------
$pubspec = (Select-String -Path pubspec.yaml -Pattern '^version:\s*(\S+)').Matches[0].Groups[1].Value
$name, $number = $pubspec -split '\+'
if ($BuildName) { $name = $BuildName }
if ($BuildNumber) { $number = $BuildNumber }
Write-Host "Versión: $name (compilación $number)"

$dist = "dist/$name+$number"
$symbols = "$dist/symbols"
$common = @(
    '--release',
    '--dart-define-from-file=env/prod.json',
    "--build-name=$name",
    "--build-number=$number",
    '--obfuscate',
    "--split-debug-info=$symbols"
)

# --- 2. Verificación ---------------------------------------------------------
Run flutter pub get
Run dart run build_runner build
if (-not $SkipTests) {
    Step 'Análisis estático y tests'
    Run flutter analyze
    Run flutter test
}

# --- 3. Compilación ----------------------------------------------------------
New-Item -ItemType Directory -Force $dist | Out-Null

Step 'Compilando APK (instalación directa)'
Run flutter build apk @common
Copy-Item build/app/outputs/flutter-apk/app-release.apk "$dist/todoapp-$name.apk" -Force

Step 'Compilando AAB (Google Play)'
Run flutter build appbundle @common
Copy-Item build/app/outputs/bundle/release/app-release.aab "$dist/todoapp-$name.aab" -Force

# --- 4. Verificación de firma ------------------------------------------------
Step 'Verificando la firma del APK'
$sdk = if ($env:ANDROID_HOME) { $env:ANDROID_HOME } else { "$env:LOCALAPPDATA\Android\Sdk" }
$apksigner = Get-ChildItem "$sdk\build-tools\*\apksigner.bat" -ErrorAction SilentlyContinue |
    Sort-Object { [version]$_.Directory.Name } -ErrorAction SilentlyContinue | Select-Object -Last 1
if ($apksigner) {
    $out = & $apksigner.FullName verify --print-certs "$dist/todoapp-$name.apk"
    if ($LASTEXITCODE -ne 0) { Fail 'apksigner no pudo verificar el APK.' }
    $out | Select-String 'Signer #1 certificate (DN|SHA-256)' | ForEach-Object { Write-Host $_.Line }
    if ($out -match 'CN=Android Debug') { Fail 'El APK está firmado con la clave de DEBUG.' }
} else {
    Write-Host 'apksigner no encontrado; se omite la verificación (instala Android SDK Build-Tools).' -ForegroundColor Yellow
}

Step "Listo: $dist"
Get-ChildItem $dist | Format-Table Name, @{ n = 'MB'; e = { [math]::Round($_.Length / 1MB, 1) } } -AutoSize
Write-Host 'Guarda la carpeta symbols/ de cada versión publicada: sin ella las trazas ofuscadas son ilegibles.'
Write-Host "Instalar en un dispositivo:  adb install -r `"$dist/todoapp-$name.apk`""
