//
//  PERNetworkTool.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
