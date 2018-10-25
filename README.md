# AppDelegate 业务拆分OC版
简化AppDelegate，采用组合模式拆分AppDelegate业务和功能

```objective-c
+ (NSArray<AppDelegate *> *)createDefault {
    
    return @[
            [PushNotificationsAppDelegate new],
            [AppearanceAppDelegate new],
            [RooViewControllerAppDelegate new],
            [InitThirdServiceAppDelegate new],
        ];
}
```



```objective-c
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
```

![屏幕快照 2018-10-25 下午8.58.11](/Users/liaoyp/Desktop/屏幕快照 2018-10-25 下午8.58.11.png)