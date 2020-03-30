//
//  PERTextureModel.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureModel.h"

@implementation PERTextureModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"replys": PERTextureReplyModel.class};
}

@end


@implementation PERTextureReplyModel

@end
