#import "GoapptivDocumentScannerPlugin.h"
#if __has_include(<goapptiv_document_scanner/goapptiv_document_scanner-Swift.h>)
#import <goapptiv_document_scanner/goapptiv_document_scanner-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "goapptiv_document_scanner-Swift.h"
#endif

@implementation GoapptivDocumentScannerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGoapptivDocumentScannerPlugin registerWithRegistrar:registrar];
}
@end
