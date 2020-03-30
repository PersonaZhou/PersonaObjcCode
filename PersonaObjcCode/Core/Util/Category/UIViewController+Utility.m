//
//  UIViewController+Utility.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "UIViewController+Utility.h"

@implementation UIViewController (Utility)

+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
      
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
      
    result = window.rootViewController;
    
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    
    if ([result isKindOfClass:UITabBarController.class]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    
    if ([result isKindOfClass:UINavigationController.class]) {
        result = [(UINavigationController *)result visibleViewController];
    }
      
    return result;
}

@end
