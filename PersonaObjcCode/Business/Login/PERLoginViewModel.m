//
//  PERLoginViewModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERLoginViewModel.h"
#import "PERNetwork+User.h"
#import "PERPersistentDataManager.h"
#import "PERServices.h"

@implementation PERLoginViewModel
@synthesize fetchCodeCommand = _fetchCodeCommand;
@synthesize loginCommand = _loginCommand;

- (RACCommand *)fetchCodeCommand {
    if (_fetchCodeCommand) return _fetchCodeCommand;
    
    @weakify(self);
    _fetchCodeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [self.services.network fetchVerificationCodeWithPhone:self.phone];
    }];
    
    return _fetchCodeCommand;
}

- (RACCommand *)loginCommand {
    if (_loginCommand) return _loginCommand;
    
    @weakify(self);
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [[[self.services.network loginWithPhone:self.phone code:self.code] doNext:^(PERUserModel *x) {
            @strongify(self);
            [[PERPersistentDataManager sharedManager] storeUser:x];
            [[PERPersistentDataManager sharedManager] storeToken:x.token];
            [self.services signInWithUser:x token:x.token];
        }] materialize];
    }];
    
    return _loginCommand;
}

@end
