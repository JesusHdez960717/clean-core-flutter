#import "CleanCorePlugin.h"
#if __has_include(<clean_core/clean_core-Swift.h>)
#import <clean_core/clean_core-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "clean_core-Swift.h"
#endif

@implementation CleanCorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCleanCorePlugin registerWithRegistrar:registrar];
}
@end
