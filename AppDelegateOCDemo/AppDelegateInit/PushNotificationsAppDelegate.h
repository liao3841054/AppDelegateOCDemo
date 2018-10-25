//
//  PushNotificationsAppDelegate.h
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "AppDelegate.h"
#import "MiPushSDK.h"

NS_ASSUME_NONNULL_BEGIN

@interface PushNotificationsAppDelegate : AppDelegate<MiPushSDKDelegate, UNUserNotificationCenterDelegate>

@end

NS_ASSUME_NONNULL_END
