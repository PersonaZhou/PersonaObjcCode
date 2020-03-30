//
//  PERNetwork.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetwork : NSObject

+ (instancetype)authenticatedClientWithUser:(PERUserModel *)user token:(NSString *)token;

- (instancetype)initWithUser:(PERUserModel *)user token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
