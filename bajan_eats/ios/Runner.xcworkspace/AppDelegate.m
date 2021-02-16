#include "AppDelegate.h"
#include "GeneratedPluginRestraint.h"
@import Firebase;
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    [GeneratedPluginRestraint registerWithRegistry:self];

    return [super application:application didFinishLaunchingWithOptions: launchOptions];

}

@end