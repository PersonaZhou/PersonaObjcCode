//
//  PERLoginViewModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERLoginViewModel : PERViewModel

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *code;

@property (nonatomic, strong, readonly) RACCommand *fetchCodeCommand;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
