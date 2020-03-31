//
//  PERHomeModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERHomeModel.h"

@implementation PERHomeModel

@end

@implementation PERHomeListItem

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"urls": PERUrlModel.class};
}

@end
