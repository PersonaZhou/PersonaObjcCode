//
//  UIView+Utility.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

- (void)showLoading {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.mode = MBProgressHUDModeCustomView;
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    aiv.color = [UIColor grayColor];
    [aiv startAnimating];
    hud.customView = aiv;
    hud.removeFromSuperViewOnHide = YES;
    [self addSubview:hud];
    [hud showAnimated:YES];
}

- (void)hideLoading {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showToast:(NSString *)string duration:(NSUInteger)duration {
    if (string && [string isKindOfClass:NSString.class]) {
        [self makeToast:string duration:duration position:CSToastPositionCenter];
    }
}

- (void)showErrorToast:(NSError *)error duration:(NSUInteger)duration {
    if (error && [error isKindOfClass:NSError.class]) {
        [self makeToast:error.localizedDescription duration:duration position:CSToastPositionCenter];
    }
}

@end
