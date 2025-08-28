MondialGP

📋 Prérequis
Avant de lancer l'application, assurez-vous d'avoir installé :

Flutter SDK (version 3.7.2 ou supérieure)

Dart SDK (version compatible avec Flutter)

Un émulateur ou appareil physique (Android/iOS)

IDE recommandé : Android Studio ou VS Code avec l'extension Flutter

🚀 Installation et lancement

1. Cloner le projet

git clone <url-du-repo>
cd mondial_gp_test

2. Installer les dépendances

flutter pub get

3. Vérifier l'environnement

flutter doctor

4. Lancer l'application
   Sur Android :
   flutter run -d android

Sur iOS :
flutter run -d ios

Sur un émulateur spécifique :
flutter run -d <nom*de_l*émulateur>

🛠 Dépendances utilisées
get: ^4.7.2 - Gestion d'état et navigation

qr_flutter: ^4.1.0 - Génération de codes QR

image_picker: ^1.2.0 - Prise de photos depuis l'appareil

share_plus: ^11.1.0 - Partage de contenu

flutter_svg: ^2.2.0 - Support des fichiers SVG

cupertino_icons: ^1.0.8 - Icônes iOS

📁 Structure des assets
Les assets sont situés dans le dossier assets/images/ et incluent :

Images vectorielles (.svg)

Images des produits et colis

Drapeaux de pays

Icônes personnalisées

🔧 Configuration supplémentaire
Permissions Android (android/app/src/main/AndroidManifest.xml)

<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

Permissions iOS (ios/Runner/Info.plist)
<key>NSCameraUsageDescription</key>
<string>Need camera access to scan QR codes and take photos of packages</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Need photo library access to save and share package photos</string>

🐛 Dépannage
Problèmes courants :
.Dépendances non installées

flutter clean
flutter pub get

.Problème de cache
flutter clean

📊 Build de l'application
Build Android (APK)
flutter build apk --release

Build Android (App Bundle)
flutter build appbundle --release

Build iOS
flutter build ios --release
