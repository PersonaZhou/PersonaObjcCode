//
//  PERUserModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PERUserModel : NSObject<NSCoding, NSSecureCoding>

@property (nonatomic, copy) NSString *userId; // 用户id
@property (nonatomic, copy) NSString *phone; // 用户手机号
@property (nonatomic, copy) NSString *location; // 用户填写的地址
@property (nonatomic, copy) NSString *gender; // 性别
@property (nonatomic, copy) NSString *nickname; // 昵称
@property (nonatomic, copy) NSString *avatar; // 头像
@property (nonatomic, copy) NSString *token; // token
@property (nonatomic, copy) NSString *ana; // 个性签名

@end

NS_ASSUME_NONNULL_END
