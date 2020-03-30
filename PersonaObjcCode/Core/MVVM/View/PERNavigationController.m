//
//  PERNavigationController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERNavigationController.h"

@interface PERNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation PERNavigationController {
    // 因动画未完成，暂存的需要push的viewControllers
    NSMutableArray *_pushViewControllersQueue;
    NSMutableArray *_pushAnimationsQueue;
    
    // 当前是否正在做push动画
    BOOL _animating;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pushViewControllersQueue = [NSMutableArray array];
    _pushAnimationsQueue = [NSMutableArray array];
    
    self.interactivePopGestureRecognizer.enabled = YES;
    
    __weak PERNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
        
        // pop手势滑动不到一半，界面未pop出去时，将动画中标示置为NO
        @weakify(self);
        [RACObserve(self.interactivePopGestureRecognizer, state) subscribeNext:^(NSNumber *x) {
            @strongify(self);
            UIGestureRecognizerState state = (UIGestureRecognizerState)x.integerValue;
            if (state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateCancelled) {
                self -> _animating = NO;
            }
        }];
    }
    [self setNavgationBarStyle];
}

- (void)setNavgationBarStyle {
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = UIColorFromRGB(0xffffff);
    bar.tintColor = [UIColor whiteColor];
    NSDictionary *dic = @{
        NSForegroundColorAttributeName: UIColorFromRGB(0x333333),
        NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
    };
    [bar setTitleTextAttributes:dic];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (_animating) {
        [_pushViewControllersQueue addObject:viewController];
        [_pushAnimationsQueue addObject:@(animated)];
        return;
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _animating = YES;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate {
    // 上一个viewcontroler动画完成时，取出暂存队列viewcontroler继续push
    _animating = NO;
    
    if (_pushViewControllersQueue.count > 0) {
        UIViewController *vc = [_pushViewControllersQueue firstObject];
        [_pushViewControllersQueue removeObjectAtIndex:0];
        
        NSNumber *animated = [_pushAnimationsQueue firstObject];
        [_pushAnimationsQueue removeObjectAtIndex:0];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self pushViewController:vc animated:animated.boolValue];
        });
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if ([navigationController.viewControllers count] == 1) {
            self.interactivePopGestureRecognizer.enabled = NO;
        } else {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}

@end
