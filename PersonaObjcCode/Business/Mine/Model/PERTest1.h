//
//  PERTest1.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/5/21.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERTest2.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERTest1 : NSObject<NSCoding, NSSecureCoding>

@property (nonatomic, copy) NSString *str;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) PERTest2 *test;
@property (nonatomic, copy) NSArray<PERTest2 *> *array;

@end

NS_ASSUME_NONNULL_END
