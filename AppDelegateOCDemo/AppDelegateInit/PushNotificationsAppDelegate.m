//
//  PushNotificationsAppDelegate.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "PushNotificationsAppDelegate.h"

@implementation PushNotificationsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@", [MiPushSDK getRegId]);
    
    [MiPushSDK registerMiPush:self type:0 connect:YES];
    
    // 处理点击通知打开app的逻辑
    NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if(userInfo){//推送信息
        NSString *messageId = [userInfo objectForKey:@"_id_"];
        if (messageId!=nil) {
            [MiPushSDK openAppNotify:messageId];
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"推送消息" message:[NSString stringWithFormat:@"%@", userInfo] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:act];
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
    
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


- ( void )application:( UIApplication *)application didReceiveRemoteNotification:( NSDictionary *)userInfo
{
    [ MiPushSDK handleReceiveRemoteNotification :userInfo];
    // 使用此方法后，所有消息会进行去重，然后通过miPushReceiveNotification:回调返回给App
}

// iOS10新加入的回调方法
// 应用在前台收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [MiPushSDK handleReceiveRemoteNotification:userInfo];
    }
    //    completionHandler(UNNotificationPresentationOptionAlert);
}

// 点击通知进入应用
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [MiPushSDK handleReceiveRemoteNotification:userInfo];
    }
    completionHandler();
}


#pragma mark MiPushSDKDelegate



#pragma mark MiPushSDKDelegate
- (void)miPushRequestSuccWithSelector:(NSString *)selector data:(NSDictionary *)data
{
    if ([selector isEqualToString:@"bindDeviceToken:"]) {
        
        UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
        action.identifier = @"action1"; //按钮的标示
        action.title=@"启动"; //按钮的标题
        action.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
        
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
        action2.identifier = @"action2";
        action2.title=@"忽略";
        action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
        action.authenticationRequired = YES;//需要解锁才能处理
        action.destructive = YES;
        
        UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
        categorys.identifier = @"category"; //这组动作的唯一标示
        [categorys setActions:@[action,action2] forContext:(UIUserNotificationActionContextMinimal)];
        
        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:
                                           (UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound)
                                                                            categories:[NSSet setWithObjects:categorys, nil]];
        [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
    }
}




- (void)miPushRequestErrWithSelector:(NSString *)selector error:(int)error data:(NSDictionary *)data
{
    // 请求失败
}






@end
