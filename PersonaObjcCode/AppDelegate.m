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
#import "PERTest1.h"

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
    
    [self sort_maopao:[NSMutableArray arrayWithArray:@[@3,@5,@1,@4,@2]]];
    [self sort_xuanzhe:[NSMutableArray arrayWithArray:@[@3,@5,@1,@4,@2]]];
    [self sort_charu:[NSMutableArray arrayWithArray:@[@3,@5,@1,@4,@2]]];
    
    int arr[5] = {1, 2, 3, 4, 5};
    int index = findKey(arr, 5, 4);
    
//    [self asyncConcurrent];
    
    int a = 5,b = 3;
    !a&&b++;
    
    PERTest2 *t2 = PERTest2.new;
    t2.title = @"test";
    
    PERTest2 *t3 = PERTest2.new;
    t3.title = @"test3";
    
    PERTest2 *t4 = PERTest2.new;
    t4.title = @"test4";
    
    PERTest1 *t = PERTest1.new;
    t.str = @"str";
    t.num = 1;
    t.test = t2;
    t.array = @[t3, t4];
    
    [[PERPersistentDataManager sharedManager] storeTest:@[t,t]];
    [[PERPersistentDataManager sharedManager] test];

    return YES;
}

/**
 * 同步执行 + 并发队列
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)asyncConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncConcurrent---end");
}

int findKey(int *arr, int length, int key) {
    int min = 0, max = length - 1, mid;
    while (min <= max) {
        mid = (min + max) / 2; //计算中间值
        if (key > arr[mid]) {
            min = mid + 1;
        } else if (key < arr[mid]) {
            max = mid - 1;
        } else {
            return mid;
        }
    }
    return -1;
}

- (void)sort_maopao:(NSMutableArray *)array {
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count - 1 - i; j ++) {
            if ([array[j] intValue] > [array[j + 1] intValue]) {
                NSNumber *temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
    NSLog(@"%@", array);
}

- (void)sort_xuanzhe:(NSMutableArray *)array {
    for (int i = 0; i < array.count; i++) {
        int minIndex = i;
        for (int j = i; j < array.count; j++) {
            if ([array[j] intValue] < [array[minIndex] intValue]) {
                minIndex = j;
            }
        }
        NSNumber *temp = array[minIndex];
        array[minIndex] = array[i];
        array[i] = temp;
    }
    NSLog(@"%@", array);
}

- (void)sort_charu:(NSMutableArray *)array {
    for (int i = 0; i < array.count - 1; i++) {
        NSNumber *currentValue = array[i + 1];
        int preIndex = i;
        while (preIndex >=0 && currentValue.intValue < [array[preIndex] intValue]) {
            array[preIndex + 1] = array[preIndex];
            preIndex --;
        }
        array[preIndex + 1] = currentValue;
    }
    NSLog(@"%@", array);
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
