//
//  NSString+Utility.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utility)

+ (NSString *)per_parameterWithFormat:(NSString *)fmt,...;

- (BOOL)validateMobile;

@end

NS_ASSUME_NONNULL_END
