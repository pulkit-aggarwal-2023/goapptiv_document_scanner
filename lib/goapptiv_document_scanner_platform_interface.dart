import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'goapptiv_document_scanner_method_channel.dart';

abstract class GoapptivDocumentScannerPlatform extends PlatformInterface {
  /// Constructs a GoapptivDocumentScannerPlatform.
  GoapptivDocumentScannerPlatform() : super(token: _token);

  static final Object _token = Object();

  static GoapptivDocumentScannerPlatform _instance =
      MethodChannelGoapptivDocumentScanner();

  /// The default instance of [GoapptivDocumentScannerPlatform] to use.
  ///
  /// Defaults to [MethodChannelGoapptivDocumentScanner].
  static GoapptivDocumentScannerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GoapptivDocumentScannerPlatform] when
  /// they register themselves.
  static set instance(GoapptivDocumentScannerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPicture() {
    throw UnimplementedError('getPicture() has not been implemented.');
  }

  Future<String?> getPictureFromGallery() {
    throw UnimplementedError('getPicture() has not been implemented.');
  }
}
