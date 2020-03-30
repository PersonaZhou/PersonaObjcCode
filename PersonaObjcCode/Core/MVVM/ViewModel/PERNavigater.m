//
//  PERNavigater.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERNavigater.h"
#import "PERBussinessHeader.h"
#import "PERNavigationController.h"
#import "PERViewModel.h"
#import "PERNavigater+ViewController.h"
#import "PERHomeViewModel.h"
#import "PERMineViewModel.h"
#import "PERLoginViewModel.h"

@interface PERNavigater()

@property (nonatomic, weak) PERServices *services;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) PERNavigationController *navigationController;

@property (nonatomic, strong) PERHomeViewModel *homeViewModel;
@property (nonatomic, strong) PERMineViewModel *mineViewModel;
@property (nonatomic, strong) PERLoginViewModel *loginViewModel;

@end

@implementation PERNavigater

- (instancetype)initWithServices:(PERServices *)services {
    if (self = [super init]) {
        self.services = services;
        [self setupTabbar];
    }
    
    return self;
}

- (UIViewController *)rootViewController {
    return _tabBarController;
}

- (UIViewController *)loginViewController {
    PERLoginViewModel *viewModel = [[PERLoginViewModel alloc] initWithServices:self.services];
    UIViewController *loginVC = [self viewControllerForViewModel:viewModel];
    PERNavigationController *naviController = [[PERNavigationController alloc] initWithRootViewController:loginVC];
    
    return naviController;
}

- (void)pushViewModel:(nonnull id<PERViewModelProtocol>)viewModel animated:(BOOL)animated {
    if ([viewModel respondsToSelector:@selector(viewModelWillAppear)]) {
        [viewModel viewModelWillAppear];
    }
    
    UIViewController *vc = [self viewControllerForViewModel:viewModel];
    [self.tabBarController.selectedViewController pushViewController:vc animated:animated];
}

- (void)popViewModelAnimated:(BOOL)animated {
    [self.tabBarController.selectedViewController popViewControllerAnimated:animated];
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
    [self.tabBarController.selectedViewController popToRootViewControllerAnimated:animated];
}

- (void)presentViewModel:(nonnull id<PERViewModelProtocol>)viewModel animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    if ([viewModel respondsToSelector:@selector(viewModelWillAppear)]) {
        [viewModel viewModelWillAppear];
    }
    
    UIViewController *vc = [self viewControllerForViewModel:viewModel];
    PERNavigationController *navi = [[PERNavigationController alloc] initWithRootViewController:vc];
    [[self.tabBarController.selectedViewController topViewController]
     presentViewController:navi animated:animated completion:completion];
}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    [self.tabBarController.selectedViewController dismissViewControllerAnimated:animated completion:completion];
}

- (BOOL)openURL:(nullable NSString *)url {
    if (!url || url.length == 0) return NO;
    
    NSString *protocol = @"persona://code";
    if (![url hasPrefix:protocol]) return NO;
    
    NSRange range = [url rangeOfString:protocol];
    url = [url substringFromIndex:(range.location + range.length)];
    
    UIViewController *vc = [self viewControllerForUrlPath:url];
    [self.tabBarController.selectedViewController pushViewController:vc animated:YES];
    return YES;
}

- (void)setupTabbar {
    self.tabBarController = [[UITabBarController alloc] init];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
    CGRect bunds = [UIScreen mainScreen].bounds;
    CGRect rect = CGRectMake(0, 0, bunds.size.width, 0.5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.918 green:0.918 blue:0.918 alpha:1.00].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UITabBar appearance] setShadowImage:img];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:0.293 green:0.295 blue:0.301 alpha:1.00]];
}

- (void)resetRootViewModel {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x333333)} forState:UIControlStateSelected];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff) size:CGSizeMake(1000, 64)] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tab_shadow"]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    
    UIViewController *homeVC = [self viewControllerForViewModel:self.homeViewModel];
    UIViewController *mineVC = [self viewControllerForViewModel:self.mineViewModel];
    
    PERNavigationController *homeNav = [[PERNavigationController alloc] initWithRootViewController:homeVC];
    PERNavigationController *mineNav = [[PERNavigationController alloc] initWithRootViewController:mineVC];
    
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_1_n"] selectedImage:[[UIImage imageNamed:@"tab_1_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineVC.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_2_n"] selectedImage:[[UIImage imageNamed:@"tab_2_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    _tabBarController.viewControllers = @[homeNav, mineNav];
}

- (BOOL)selectTabBarIndex:(NSUInteger)index {
    if (index < self.tabBarController.viewControllers.count) {
        self.tabBarController.selectedIndex = index;
        return YES;
    }
    return NO;
}

- (PERHomeViewModel *)homeViewModel {
    if (_homeViewModel) return _homeViewModel;
    
    _homeViewModel = [[PERHomeViewModel alloc] initWithServices:self.services];
    
    return _homeViewModel;
}

- (PERMineViewModel *)mineViewModel {
    if (_mineViewModel) return _mineViewModel;
    
    _mineViewModel = [[PERMineViewModel alloc] initWithServices:self.services];
    
    return _mineViewModel;
}

- (PERLoginViewModel *)loginViewModel {
    if (_loginViewModel) return _loginViewModel;
    
    _loginViewModel = [PERLoginViewModel viewModelWithServices:self.services];
    
    return _loginViewModel;
}

@end
