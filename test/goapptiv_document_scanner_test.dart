// import 'package:flutter_test/flutter_test.dart';
// import 'package:goapptiv_document_scanner/goapptiv_document_scanner.dart';
// import 'package:goapptiv_document_scanner/goapptiv_document_scanner_platform_interface.dart';
// import 'package:goapptiv_document_scanner/goapptiv_document_scanner_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockGoapptivDocumentScannerPlatform
//     with MockPlatformInterfaceMixin
//     implements GoapptivDocumentScannerPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final GoapptivDocumentScannerPlatform initialPlatform = GoapptivDocumentScannerPlatform.instance;

//   test('$MethodChannelGoapptivDocumentScanner is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelGoapptivDocumentScanner>());
//   });

//   test('getPlatformVersion', () async {
//     GoapptivDocumentScanner goapptivDocumentScannerPlugin = GoapptivDocumentScanner();
//     MockGoapptivDocumentScannerPlatform fakePlatform = MockGoapptivDocumentScannerPlatform();
//     GoapptivDocumentScannerPlatform.instance = fakePlatform;

//     expect(await goapptivDocumentScannerPlugin.getPicture(), '42');
//   });
// }
