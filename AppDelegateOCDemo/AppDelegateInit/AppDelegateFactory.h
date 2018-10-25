//
//  AppDelegateFactory.h
//  AppDelegateOCDemo
//
//  Created by larry on 2018/10/25.
//  Copyright © 2018 liaoyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegateFactory : NSObject

+ (NSArray<AppDelegate *> *)createDefault;

@end

NS_ASSUME_NONNULL_END
