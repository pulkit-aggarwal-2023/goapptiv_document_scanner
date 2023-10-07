import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:goapptiv_document_scanner/constants.dart';
import 'package:permission_handler/permission_handler.dart';

import 'goapptiv_document_scanner_platform_interface.dart';

/// An implementation of [GoapptivDocumentScannerPlatform] that uses method channels.
class MethodChannelGoapptivDocumentScanner
    extends GoapptivDocumentScannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('goapptiv_document_scanner');

  @override
  Future<String?> getPicture({bool letUserCropImage = true}) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      if (android.version.sdkInt < 33) Permission.storage,
    ].request();
    if (statuses.containsValue(PermissionStatus.denied)) {
      throw Exception(Constants.permissionDenied);
    }
    if (Platform.isAndroid) {
      final List<dynamic> pictures = await methodChannel.invokeMethod(
        'getPicture',
        {
          'letUserAdjustCrop': letUserCropImage,
        },
      );
      return pictures.isEmpty ? null : pictures.first;
    } else {
      final String? filePath = await methodChannel.invokeMethod("getPicture");
      return filePath?.split('file://')[1];
    }
  }

  @override
  Future<String?> getPictureFromGallery({bool letUserCropImage = true}) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    Map<Permission, PermissionStatus> statuses = await [
      if (android.version.sdkInt < 33)
        Permission.storage
      else ...[Permission.photos, Permission.videos]
    ].request();
    if (statuses.containsValue(PermissionStatus.denied)) {
      throw Exception(Constants.permissionDenied);
    }
    if (Platform.isAndroid) {
      final List<dynamic> pictures = await methodChannel.invokeMethod(
        'getPictureFromGallery',
        {
          'letUserAdjustCrop': letUserCropImage,
        },
      );

      return pictures.isEmpty ? null : pictures.first;
    } else {
      final String? filePath =
          await methodChannel.invokeMethod("getPictureFromGallery");
      return filePath?.split('file://')[1];
    }
  }
}
