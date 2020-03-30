//
//  PERNetwork+User.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetwork (User)

- (RACSignal *)fetchVerificationCodeWithPhone:(NSString *)phone;

- (RACSignal *)loginWithPhone:(NSString *)phone code:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
