//
//  PERMineViewModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERMineViewModel.h"

@implementation PERMineViewModel
@synthesize logoutCommand = _logoutCommand;

- (RACCommand *)logoutCommand {
    if (_logoutCommand) return _logoutCommand;
    
    @weakify(self);
    _logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        [self.services signOut];
        [[PERPersistentDataManager sharedManager] cleanSession];
        return [RACSignal empty];
    }];
    
    return _logoutCommand;
}

@end
