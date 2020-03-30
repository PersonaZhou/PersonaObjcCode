//
//  UIView+Utility.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utility)

- (void)showLoading;
- (void)hideLoading;

- (void)showToast:(NSString *)string duration:(NSUInteger)duration;
- (void)showErrorToast:(NSError *)error duration:(NSUInteger)duration;

@end

NS_ASSUME_NONNULL_END
