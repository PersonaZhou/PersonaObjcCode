//
//  PERViewModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

@implementation PERViewModel

- (instancetype)initWithServices:(PERServices *)services {
    if (self = [super init]) {
        self.services = services;
    }
    return self;
}

+ (instancetype)viewModelWithServices:(PERServices *)services {
    PERViewModel *viewModel = [[PERViewModel alloc] init];
    viewModel.services = services;
    return viewModel;
}

@end
