#import "AppDelegate.h"
#import "MetalView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *root = [[UIViewController alloc] init];
    MetalView *view = [[MetalView alloc] initWithFrame:self.window.bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    root.view = view;
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
