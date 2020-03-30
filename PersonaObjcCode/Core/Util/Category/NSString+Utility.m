//
//  NSString+Utility.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)

+ (NSString *)per_parameterWithFormat:(NSString *)fmt,... {
    if (!fmt) {
        return nil;
    }
    
    va_list arg_ptr;
    va_start(arg_ptr, fmt);
    NSString *s = [[NSString alloc] initWithFormat:fmt arguments:arg_ptr];
    va_end(arg_ptr);
    
    return s;
}

- (BOOL)validateMobile {
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

@end
