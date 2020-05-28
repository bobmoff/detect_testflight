#import "DetectTestflightPlugin.h"
#if __has_include(<detect_testflight/detect_testflight-Swift.h>)
#import <detect_testflight/detect_testflight-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "detect_testflight-Swift.h"
#endif

@implementation DetectTestflightPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDetectTestflightPlugin registerWithRegistrar:registrar];
}
@end
