//
//  RACSignal+JSONParser.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "RACSignal+JSONParser.h"

@implementation RACSignal (JSONParser)

- (RACSignal *)parseClass:(Class)cls {
    return [self flattenMap:^id(id value) {
        PERAssert([value isKindOfClass:[NSDictionary class]]);
        NSError* error = nil;
        id obj = [cls yy_modelWithDictionary:value];
        PERAssert(!error);
        if (error) {
            return [RACSignal error:error];
        }
        return [RACSignal return:obj];
    }];
}

@end
