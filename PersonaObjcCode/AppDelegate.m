//
//  AppDelegate.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "AppDelegate.h"
#import "PERServices.h"
#import "PERNavigater.h"
#import "PERTTYLogger.h"

@interface AppDelegate ()

@property (nonatomic, strong) PERNavigater *navigater;
@property (nonatomic, strong) PERServices *services;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:1];
    
    // 初始化日志
    [self setupLog];
    // 初始化哆啦A梦组件
    [self setupDoraemon];
    
    // 读取user和token缓存
    PERUserModel *user = [[PERPersistentDataManager sharedManager] user];
    NSString *token = [[PERPersistentDataManager sharedManager] token];
    
    // 配置全局services、navigater和network
    self.services = [PERServices authenticatedClientWithUser:user token:token];
    self.navigater = [[PERNavigater alloc] initWithServices:self.services];
    self.services.network = [PERNetwork authenticatedClientWithUser:user token:token];
    self.services.navigater = self.navigater;
    
    // 初始化rootViewController
    UIViewController *rootViewController = self.navigater.loginViewController;
    if (self.services.isAuthenticated) {
        [self.navigater resetRootViewModel];
        rootViewController = self.navigater.rootViewController;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    // 监听登录和注销
    @weakify(self);
    [self.services.signInSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.navigater = [[PERNavigater alloc] initWithServices:self.services];
        self.services.navigater = self.navigater;
        [self.navigater resetRootViewModel];
        
        self.window.rootViewController = self.navigater.rootViewController;
    }];
    
    [self.services.signOutSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.navigater = [[PERNavigater alloc] initWithServices:self.services];
        
        self.window.rootViewController = self.navigater.loginViewController;;
    }];

    return YES;
}

- (void)setupLog {
#ifdef DEBUG
    [[PERLogManager sharedInstance] addLogger:[[PERTTYLogger alloc] init]];
#endif
}

- (void)setupDoraemon {
#ifdef DEBUG
    [[DoraemonManager shareInstance] installWithPid:@"46c5f8314f19de21df7a172da340eb72"];
#endif
}

@end
