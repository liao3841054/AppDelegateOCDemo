//
//  ThirdServiceAppDelegate.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "InitThirdServiceAppDelegate.h"

#import <Bugly/Bugly.h>

#import <UMAnalytics/MobClick.h>

#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import <TencentOpenAPI/QQApiInterface.h>

@implementation InitThirdServiceAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configBugly];
    
//    [self configUMengStatistics];
//    
//    [self configUMengShare];

    return YES;
}


- (void)configBugly {
    BOOL isDebug = NO;
#if DEBUG
    isDebug = YES;
#endif
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.debugMode = isDebug;
    config.reportLogLevel = BuglyLogLevelError;
#if DEBUG
    config.channel = @"Debuging";
#else
    config.channel = @"App Store";
#endif
    [Bugly startWithAppId:@"" developmentDevice:isDebug config:config];
}



// 友盟统计
- (void)configUMengStatistics {
#if !DEBUG
    [UMConfigure initWithAppkey:kUMengAppKey channel:@"App Store"];
    [UMConfigure setEncryptEnabled:YES];
#endif
}


- (void)configUMengShare {
    
    // 设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"kUMengAppKey"];
    
    // 获取友盟social版本号
    NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    // 设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"kWeixinAppID" appSecret:@"kWeixinAppSecret" redirectURL:@"http://mobile.umeng.com/social"];
    
    // 设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"kSinaAppID"  appSecret:@"kSinaAppSecret" redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    // 设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"kQQAppID"  appSecret:@"kQQAppKey" redirectURL:@"http://mobile.umeng.com/social"];
    
    // 设置支持没有客户端情况下使用SSO授权
    [[UMSocialQQHandler defaultManager] setSupportWebView:YES];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [[UMSocialManager defaultManager] handleOpenURL:url];
}

// iOS 7&8
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    BOOL btHandleOpenURLResult = [self commHandleOpenURL:url];
    return btHandleOpenURLResult;
}


// iOS 9&9+
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary *)options {
    
    BOOL btHandleOpenURLResult = [self commHandleOpenURL:url];
    return btHandleOpenURLResult;
}

/// 解析
- (BOOL)commHandleOpenURL:(NSURL *)url {
    
    // 微信授权登录
//    if ([[WeChatAuth sharedHandler] handleOpenURL:url]) {
//        return YES;
//    }
    
    // UMSocial
    if([[UMSocialManager defaultManager] handleOpenURL:url]){
        return YES;
    }
    return NO;
}

@end
