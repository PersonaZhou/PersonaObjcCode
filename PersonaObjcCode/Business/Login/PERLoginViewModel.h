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

@property (nonatomic, copy) NSString *phone; // 手机号
@property (nonatomic, copy) NSString *code; // 验证码

@property (nonatomic, strong, readonly) RACCommand *fetchCodeCommand; // 获取验证码接口
@property (nonatomic, strong, readonly) RACCommand *loginCommand; // 登录接口

@end

NS_ASSUME_NONNULL_END
