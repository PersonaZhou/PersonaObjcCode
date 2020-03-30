//
//  PERNavigater.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERServices.h"
#import "PERNavigaterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNavigater : NSObject<PERNavigaterProtocol>

@property (nonatomic, strong) UITabBarController *rootViewController;
@property (nonatomic, strong) UIViewController *loginViewController;

- (instancetype)initWithServices:(PERServices *)services;

- (void)resetRootViewModel;

@end

NS_ASSUME_NONNULL_END
