//
//  PERPersistentDataManager.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/2.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERPersistentDataManager : NSObject

+ (instancetype)sharedManager;

- (void)storeUser:(nullable PERUserModel *)user;
- (PERUserModel *)user;

- (void)storeToken:(nullable NSString *)token;
- (NSString *)token;

- (void)cleanSession;

- (void)storeTest:(NSArray *)array;

- (NSArray *)test;

@end

NS_ASSUME_NONNULL_END
