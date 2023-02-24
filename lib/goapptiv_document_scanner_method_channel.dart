import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import 'goapptiv_document_scanner_platform_interface.dart';

const _uuid = Uuid();

/// An implementation of [GoapptivDocumentScannerPlatform] that uses method channels.
class MethodChannelGoapptivDocumentScanner
    extends GoapptivDocumentScannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('goapptiv_document_scanner');

  @override
  Future<String?> getPicture() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
    ].request();
    if (statuses.containsValue(PermissionStatus.denied)) {
      throw Exception("Permission not granted");
    }
    if (Platform.isAndroid) {
      final imagePath = join(
          (await getApplicationSupportDirectory()).path, "${_uuid.v4()}.jpg");
      final dynamic pictures = await methodChannel.invokeMethod('getPicture', {
        'save_to': imagePath,
        'can_use_gallery': false,
        'scan_title': 'Scanning',
        'crop_title': 'Crop',
        'crop_black_white_title': 'Black White',
        'crop_reset_title': 'Reset',
      });
      return pictures == false ? null : imagePath;
    } else {
      final String? filePath = await methodChannel.invokeMethod("getPicture");
      return filePath?.split('file://')[1];
    }
  }
}
