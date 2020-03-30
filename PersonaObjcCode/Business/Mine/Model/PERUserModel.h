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

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *ana;

@end

NS_ASSUME_NONNULL_END
