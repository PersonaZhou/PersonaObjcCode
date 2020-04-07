//
//  UIAlertController+Utility.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PERActionSheetUrlModel;

@interface UIAlertController (Utility)

+ (void)showActionSheetWithTitle:(nullable NSString *)title message:(nullable NSString *)message urls:(NSArray<PERUrlModel *> *)urls;

@end

NS_ASSUME_NONNULL_END
