//
//  AppDelegate.m
//  ZYPopupView
//
//  Created by 东天红iOS on 2021/12/16.
//

#import "AppDelegate.h"
#import "ZYViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [ZYViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
