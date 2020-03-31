//
//  PERNetwork+Mock.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+Mock.h"
#import "PERNetwork+CustomTableMock.h"
#import "PERNetwork+HomeMock.h"
#import "PERNetwork+TextureMock.h"
#import "PERNetwork+UserMock.h"

@implementation PERNetwork (Mock)

- (RACSignal *)requestPostWithPath:(NSString *)path contentType:(PERRequestContentType)type parameters:(NSDictionary *)parameters {
    
    RACSignal *s = [RACSignal empty];
    
    if ([path isEqualToString:@"/login/send_sms_code"]) {
        s = [self fetchSMSCodeWithParameters:parameters];
    }else if ([path isEqualToString:@"/login/sigin_by_sms_code"]) {
        s = [self loginBySMSCodeWithParameters:parameters];
    }else if ([path isEqualToString:@"/home/banner"]) {
        s = [self fetchHomeBanner:parameters];
    }else if ([path isEqualToString:@"/home/list"]) {
        s = [self fetchHomeList:parameters];
    }else if ([path isEqualToString:@"/texture/list"]) {
        s = [self fetchTextureList:parameters];
    }else if ([path isEqualToString:@"/customtable/record"]) {
        s = [self fetchCustomTableBanner:parameters];
    }else if ([path isEqualToString:@"/customtable/list"]) {
        s = [self fetchCustomTableList:parameters];
    }
    
    return s;
}

@end
