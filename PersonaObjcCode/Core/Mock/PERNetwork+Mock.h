//
//  PERNetwork+Mock.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, PERRequestContentType){
    PERRequestContentTypeJson = 0,
    PERRequestContentTypeFormData = 1
};

@interface PERNetwork (Mock)

- (RACSignal *)requestPostWithPath:(NSString *)path contentType:(PERRequestContentType)type parameters:(nullable NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
