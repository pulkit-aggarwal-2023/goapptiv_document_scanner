import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:goapptiv_document_scanner/android_options.dart';
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
  Future<String?> getPicture(
      {AndroidOptions options = const AndroidOptions()}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    if (statuses.containsValue(PermissionStatus.denied)) {
      throw Exception("Permission not granted");
    }
    if (Platform.isAndroid) {
      final imagePath = join(
          (await getApplicationSupportDirectory()).path, "${_uuid.v4()}.jpg");
      final dynamic pictures = await methodChannel.invokeMethod('getPicture', {
        'save_to': imagePath,
        'scan_title': options.scanTitle,
        'crop_title': options.cropTitle,
        'crop_black_white_title': options.blackAndWhiteTitle,
        'crop_reset_title': options.resetTitle,
      });
      return pictures == false ? null : imagePath;
    } else {
      final String? filePath = await methodChannel.invokeMethod("getPicture");
      return filePath?.split('file://')[1];
    }
  }

  @override
  Future<String?> getPictureFromGallery(
      {AndroidOptions options = const AndroidOptions()}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    if (statuses.containsValue(PermissionStatus.denied)) {
      throw Exception("Permission not granted");
    }
    if (Platform.isAndroid) {
      final imagePath = join(
          (await getApplicationSupportDirectory()).path, "${_uuid.v4()}.jpg");
      final dynamic pictures =
          await methodChannel.invokeMethod('getPictureFromGallery', {
        'save_to': imagePath,
        'scan_title': options.scanTitle,
        'crop_title': options.cropTitle,
        'crop_black_white_title': options.blackAndWhiteTitle,
        'crop_reset_title': options.resetTitle,
        'from_gallery': true,
      });
      return pictures == false ? null : imagePath;
    } else {
      final String? filePath =
          await methodChannel.invokeMethod("getPictureFromGallery");
      return filePath?.split('file://')[1];
    }
  }
}
