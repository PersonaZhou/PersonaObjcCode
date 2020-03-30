//
//  PERNetwork.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"
#import "PERNetworkTool.h"

@interface PERNetwork()

@property (nonatomic, strong) PERUserModel *user;
@property (nonatomic, copy) NSString *token;

@end

@implementation PERNetwork

+ (instancetype)authenticatedClientWithUser:(PERUserModel *)user token:(NSString *)token {
    PERNetwork *network = [[PERNetwork alloc] initWithUser:user token:token];
    return network;
}

- (instancetype)initWithUser:(PERUserModel *)user token:(NSString *)token {
    if (self = [super init]) {
        self.user = user;
        self.token = token;
    }
    
    return self;
}

- (void)signInWithUser:(PERUserModel *)user token:(NSString *)token {
    self.user = user;
    self.token = token;
}

- (void)signOut {
    self.user = nil;
    self.token = nil;
}

@end
