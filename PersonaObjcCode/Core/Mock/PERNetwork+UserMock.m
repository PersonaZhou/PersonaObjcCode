//
//  PERNetwork+UserMock.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+UserMock.h"

@implementation PERNetwork (UserMock)

- (RACSignal *)fetchSMSCodeWithParameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@{@"status": @YES, @"message": @"短信验证码发送成功，请注意查收"}];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)loginBySMSCodeWithParameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *dict = @{
            @"userId": @"PER_1319488431",
            @"phone": @"182******663",
            @"location": @"成都市 · 高新区天府大道北段1700号(环球中心)",
            @"gender": @"male",
            @"nickname": @"Pྉeྉrྉsྉoྉnྉaྉ",
            @"avatar": @"avatar_persona",
            @"ana": @"你学过的每一样东西，你遭受的每一次苦难，都会在你一生中的某个时候派上用场。",
            @"token": @"NUSER_D239JdowSKDmcjkadeqiodaXDAFE",
        };
        
        [subscriber sendNext:dict];
        [subscriber sendCompleted];
        
//        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:1 userInfo:@{NSLocalizedDescriptionKey: @"抱歉哦~ 服务器已宕机"}];
//        [subscriber sendError:error];
        
        return nil;
    }];
}


@end
