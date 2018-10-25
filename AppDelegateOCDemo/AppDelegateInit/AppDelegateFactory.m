//
//  AppDelegateFactory.m
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import "AppDelegateFactory.h"
#import "PushNotificationsAppDelegate.h"
#import "AppearanceAppDelegate.h"
#import "InitThirdServiceAppDelegate.h"
#import "RooViewControllerAppDelegate.h"
#import "InitThirdServiceAppDelegate.h"

@implementation AppDelegateFactory

+ (NSArray<AppDelegate *> *)createDefault {
    
    return @[
            [PushNotificationsAppDelegate new],
            [AppearanceAppDelegate new],
            [RooViewControllerAppDelegate new],
            [InitThirdServiceAppDelegate new],
        ];
}

@end
