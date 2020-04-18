//
//  PERUserModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERUserModel.h"

@implementation PERUserModel

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            const char *p_name = ivar_getName(ivar);
            NSString *key = [NSString stringWithCString:p_name encoding:NSUTF8StringEncoding];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        
        free(ivars);
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *p_name = ivar_getName(ivar);
        NSString *key = [NSString stringWithCString:p_name encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    
    free(ivars);
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
