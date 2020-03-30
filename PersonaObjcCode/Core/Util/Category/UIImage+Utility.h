//
//  UIImage+Utility.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Utility)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageLoadingDefault;

@end

NS_ASSUME_NONNULL_END
