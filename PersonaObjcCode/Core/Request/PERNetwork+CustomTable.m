//
//  PERNetwork+CustomTable.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork+CustomTable.h"
#import "PERCustomTableBannerModel.h"
#import "PERNetwork+Mock.h"

@implementation PERNetwork (CustomTable)

- (RACSignal *)fetchCustomTableBanner {
    return [[[self requestPostWithPath:@"/customtable/record" contentType:PERRequestContentTypeJson parameters:nil] parseClass:PERCustomTableBannerModel.class] delay:0.5f];
}

- (RACSignal *)fetchCustomTableListWithPage:(NSUInteger)page pageSize:(NSUInteger)pageSize {
    NSDictionary *parameters = @{@"page": @(page), @"pageSize": @(pageSize)};
    
    return [[[self requestPostWithPath:@"/customtable/list" contentType:PERRequestContentTypeJson parameters:parameters] parseClass:PERCustomTableListItemModel.class] delay:1.0];
}

@end
