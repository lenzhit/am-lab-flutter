# Laboratorio 1: Aplicación Flutter de Presentación / Perfil

Proyecto académico desarrollado en Flutter y Dart correspondiente a la **Sesión 1** del curso de Desarrollo de Aplicaciones Móviles.

---

## 📱 Capturas y Características

- **AppBar personalizada:** Barra superior en color ámbar con título y botones de acción (`search`, `settings`).
- **Diseño vertical estructurado:** Uso de `Column` con padding de 20 px.
- **Imagen de perfil:** Renderizado circular con `CircleAvatar` conectado a `AssetImage('assets/img/persona.png')`.
- **Pie con información:** Organización horizontal mediante `Row(mainAxisAlignment: MainAxisAlignment.center)` con texto estilizado.

---

## 📂 Estructura del Proyecto

```text
.
├── .github/
│   └── workflows/
│       └── build_apk.yml       # Compilación automática del APK en GitHub
├── assets/
│   └── img/
│       └── persona.png         # Imagen del perfil
├── lib/
│   ├── main.dart               # Punto de entrada (runApp, MaterialApp)
│   └── home.dart               # Pantalla principal (Scaffold, AppBar, Body)
├── pubspec.yaml                # Registro de dependencias y assets
├── analysis_options.yaml       # Configuración del linter
└── README.md
```

---

## 🚀 Cómo compilar y descargar el APK en tu teléfono

### Opción 1: Descargar directamente desde GitHub (Recomendada)
1. Sube este repositorio a tu cuenta de GitHub.
2. Ve a la pestaña **Actions** en tu repositorio de GitHub.
3. El workflow **Build Android APK** se ejecutará automáticamente con cada `push`.
4. Al finalizar (ícono verde ✅), haz clic en la ejecución y baja hasta la sección **Artifacts**.
5. Descarga el archivo `sesion1-app-release.zip`, descomprímelo e instala el `.apk` en tu teléfono Android.

### Opción 2: Ejecutar localmente desde Cursor / Terminal
```bash
# 1. Obtener dependencias
flutter pub get

# 2. Ejecutar en emulador o teléfono conectado
flutter run

# 3. O compilar APK release manualmente
flutter build apk --release
```
El archivo generado se ubicará en: `build/app/outputs/flutter-apk/app-release.apk`.
