//
//  PERNetwork+User.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/3.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+User.h"
#import "PERNetwork+Mock.h"

@implementation PERNetwork (User)

- (RACSignal *)fetchVerificationCodeWithPhone:(NSString *)phone {
    NSDictionary *parameters = @{@"phone": phone};
    
    return [self requestPostWithPath:@"/login/send_sms_code" contentType:PERRequestContentTypeJson parameters:parameters];
}

- (RACSignal *)loginWithPhone:(NSString *)phone code:(NSString *)code {
    NSDictionary *parameters = @{@"phone": phone, @"code": code};
    
    return [[self requestPostWithPath:@"/login/sigin_by_sms_code" contentType:PERRequestContentTypeJson parameters:parameters] parseClass:PERUserModel.class];
}

@end
