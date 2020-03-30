//
//  PERServices.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERServices.h"

@interface PERServices()

@property (nonatomic, strong) RACSubject *signInSubject;
@property (nonatomic, strong) RACSubject *signOutSubject;

@end

@implementation PERServices

@synthesize navigater = _navigater;
@synthesize network = _network;
@synthesize isAuthenticated = _isAuthenticated;
@synthesize token = _token;
@synthesize user = _user;
@synthesize signInSignal = _signInSignal;
@synthesize signOutSignal = _signOutSignal;

+ (instancetype)authenticatedClientWithUser:(PERUserModel *)user token:(NSString *)token {
    PERServices *services = [[PERServices alloc] initWithUser:user token:token];
    return services;
}

- (instancetype)initWithUser:(PERUserModel *)user token:(NSString *)token {
    if (self = [super init]) {
        _user = user;
        _token = token;
    }
    
    return self;
}

- (void)signInWithUser:(PERUserModel *)user token:(NSString *)token {
    _user = user;
    _token = token;
    
    [self.signInSubject sendNext:user];
}

- (void)signOut {
    _user = nil;
    _token = nil;
    
    [self.signOutSubject sendNext:nil];
}

- (BOOL)isAuthenticated {
    return (_token != nil);
}

- (RACSignal *)signInSignal {
    if (_signInSubject) return _signInSubject;
    
    _signInSubject = [RACSubject subject];
    
    return _signInSubject;
}

- (RACSignal *)signOutSignal {
    if (_signOutSubject) return _signOutSubject;
    
    _signOutSubject = [RACSubject subject];
    
    return _signOutSubject;
}

@end
