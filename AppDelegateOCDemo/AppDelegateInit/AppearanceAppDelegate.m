//
//  AppearanceAppDelegate.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "AppearanceAppDelegate.h"

@implementation AppearanceAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
//    [UINavigationBar appearance].backIndicatorImage =
//    [UINavigationBar appearance].backIndicatorTransitionMaskImage =
//    [UIImage templateImageNamed:@"nav_bar_back_icon_white"];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    // hide title of back button
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    NSShadow *clearShadow = [[NSShadow alloc] init];
    clearShadow.shadowColor = [UIColor clearColor];
    clearShadow.shadowOffset = CGSizeMake(0, 0);
    
    UIColor *normalTitleColor = [UIColor whiteColor];
    UIColor *highlightedTitleColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : normalTitleColor,
                                                           NSShadowAttributeName : clearShadow
                                                           } forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : highlightedTitleColor,
                                                           NSShadowAttributeName : clearShadow
                                                           } forState:UIControlStateHighlighted];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    [[UIToolbar appearance] setBarTintColor:[UIColor whiteColor]];
 
    
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


@end
