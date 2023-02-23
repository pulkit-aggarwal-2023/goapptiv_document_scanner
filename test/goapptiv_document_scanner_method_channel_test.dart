import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goapptiv_document_scanner/goapptiv_document_scanner_method_channel.dart';

void main() {
  MethodChannelGoapptivDocumentScanner platform =
      MethodChannelGoapptivDocumentScanner();
  const MethodChannel channel = MethodChannel('goapptiv_document_scanner');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPicture(), '42');
  });
}
