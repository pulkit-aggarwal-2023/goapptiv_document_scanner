// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:goapptiv_document_scanner/android_options.dart';

import 'goapptiv_document_scanner_platform_interface.dart';

class GoapptivDocumentScanner {
  static Future<String?> getPicture({AndroidOptions? options}) {
    return GoapptivDocumentScannerPlatform.instance
        .getPicture(options: options ?? const AndroidOptions());
  }

  static Future<String?> getPictureFromGallery({AndroidOptions? options}) {
    return GoapptivDocumentScannerPlatform.instance
        .getPictureFromGallery(options: options ?? const AndroidOptions());
  }
}
