//
//  UIImage+Utility.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "UIImage+Utility.h"

@implementation UIImage (Utility)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (size.width == 0 || size.height == 0) {
        return nil;
    }
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageLoadingDefault {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image_loading" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage sd_imageWithGIFData:gifData];
    return image;
}

@end
