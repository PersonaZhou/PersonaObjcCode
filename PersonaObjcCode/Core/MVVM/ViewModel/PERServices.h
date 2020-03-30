//
//  PERServices.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERNavigaterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERServices : NSObject

@property (nonatomic, strong) id<PERNavigaterProtocol> navigater;
@property (nonatomic, strong) PERNetwork *network;

@property (nonatomic, assign, readonly) BOOL isAuthenticated;
@property (nonatomic, strong, readonly) NSString *token;
@property (nonatomic, strong, readonly) PERUserModel *user;
@property (nonatomic, strong, readonly) RACSignal *signInSignal;
@property (nonatomic, strong, readonly) RACSignal *signOutSignal;

+ (instancetype)authenticatedClientWithUser:(PERUserModel *)user token:(NSString *)token;

- (instancetype)initWithUser:(PERUserModel *)user token:(NSString *)token;
- (void)signInWithUser:(PERUserModel *)user token:(NSString *)token;
- (void)signOut;

@end

NS_ASSUME_NONNULL_END
