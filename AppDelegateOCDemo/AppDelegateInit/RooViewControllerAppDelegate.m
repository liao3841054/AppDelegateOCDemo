//
//  RooViewControllerAppDelegate.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "RooViewControllerAppDelegate.h"
#import "ViewController.h"

@implementation RooViewControllerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *rootController = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}


@end
