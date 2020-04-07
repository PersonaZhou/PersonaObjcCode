//
//  RACSignal+JSONParser.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "RACSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACSignal (JSONParser)

/**
*  转换model
*
*  @param cls    指定转换的class
*/
- (RACSignal *)parseClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
