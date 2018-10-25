//
//  AppDelegate.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegateFactory.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSArray<AppDelegate *> *appDelegates;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
    self.appDelegates = [AppDelegateFactory createDefault];

    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj application:application didFinishLaunchingWithOptions:launchOptions];
    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj applicationWillResignActive:application];
    }];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj applicationDidEnterBackground:application];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj applicationWillEnterForeground:application];
    }];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj applicationDidBecomeActive:application];
    }];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj applicationWillTerminate:application];
    }];
}



#pragma mark -
#pragma mark - iOS9 universonl link

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(nonnull NSString *)userActivityType {
    
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj application:application willContinueUserActivityWithType:userActivityType];
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler
{
    __block __result = NO;
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __result =  [obj application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
        if (__result) {
            *stop = YES;
        }
    }];
    return __result;
}

#pragma mark -  handleOpenURL

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    __block __result = NO;
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __result =  [obj application:application handleOpenURL:url];
        if (__result) {
            *stop = YES;
        }
    }];
    return __result;
}

// iOS 7&8
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    __block __result = NO;
    [self.appDelegates enumerateObjectsUsingBlock:^(AppDelegate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __result = [obj application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        if (__result) {
            *stop = YES;
        }
    }];
    return __result;
    
}

@end
