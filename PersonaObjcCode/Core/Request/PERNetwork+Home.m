//
//  PERNetwork+Home.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+Home.h"
#import "PERNetwork+Mock.h"
#import "PERHomeModel.h"

@implementation PERNetwork (Home)

- (RACSignal *)fetchHomeBanner {
    return [[[self requestPostWithPath:@"/home/banner" contentType:PERRequestContentTypeJson parameters:@{}] parseClass:PERHomeListItem.class] delay:0.25];
}

- (RACSignal *)fetchHomeListWithPage:(NSUInteger)page pageSize:(NSUInteger)pageSize {
    NSDictionary *parameters = @{@"page": @(page), @"pageSize": @(pageSize)};
    
    return [[[self requestPostWithPath:@"/home/list" contentType:PERRequestContentTypeJson parameters:parameters] parseClass:PERHomeListItem.class] delay:0.5];
}

@end
