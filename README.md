# GoApptiv Document Scanner

A Document scanner plugin for scanning of invoice and KYC documents with edge detection and cropping facility.

## Installation

Get the package

```yaml
  goapptiv_document_scanner
    git:
        url: https://github.com/Biswajit-Paul-2021/goapptiv_document_scanner.git
        ref: master

```

## Usage/Examples

### iOS

iOS 10.0 or higher is needed to use the plugin. Change the minimum platform version to 10 (or higher) in your `ios/Podfile` file.

Add below permission to the `ios/Runner/Info.plist`:

- one with the key `Privacy - Camera Usage Description` and a usage description.

Or in text format add the key:

```xml
<key>NSCameraUsageDescription</key>
<string>Can I use the camera please?</string>
```

### Android

The plugin code is written in kotlin 1.7.10 so the same has to be set to the android project of yours for compilation.
Change the kotlin_version to 1.5.31 in your `android/build.gradle` file.

```
ext.kotlin_version = '1.7.10'
```

Change the minimum Android SDK version to 21 (or higher) in your `android/app/build.gradle` file.

```
minSdkVersion 21
```

### Add dependency：

Please check the latest version before installation.

```
dependencies:
  flutter:
    sdk: flutter
  goapptiv_document_scanner
    git:
        url: https://github.com/Biswajit-Paul-2021/goapptiv_document_scanner.git
        ref: master
```

### Add the following imports to your Dart code:

```
import 'package:edge_detection/edge_detection.dart';
```

```dart
    // Use below code for taking image from camera.
try {
    //Make sure to await the call to GetPicture.
    final imagePath = await  await GoapptivDocumentScanner.getPicture();
} catch (e) {
    print(e);
}
// Use below code for selecting directly from the gallery.
try {
    //Make sure to await the call to getPictureFromGallery.
    final imagePath = await  await GoapptivDocumentScanner.getPictureFromGallery();
} catch (e) {
    print(e);
}
```

## Authors

- [@BiswajitP](https://github.com/Biswajit-Paul-2021)
