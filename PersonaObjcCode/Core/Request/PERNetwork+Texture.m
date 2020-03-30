//
//  PERNetwork+Texture.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+Texture.h"
#import "PERNetwork+Mock.h"
#import "PERTextureModel.h"

@implementation PERNetwork (Texture)

- (RACSignal *)fetchListWithPage:(NSUInteger)page pageSize:(NSUInteger)pageSize {
    NSDictionary *parameters = @{@"page": @(page), @"pageSize": @(pageSize)};
    
    return [[[self requestPostWithPath:@"/texture/list" contentType:PERRequestContentTypeJson parameters:parameters] parseClass:PERTextureModel.class] delay:1.0];
}

@end
