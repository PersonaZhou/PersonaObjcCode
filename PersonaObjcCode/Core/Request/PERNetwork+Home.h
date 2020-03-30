//
//  PERNetwork+Home.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetwork (Home)

- (RACSignal *)fetchHomeBanner;

- (RACSignal *)fetchHomeListWithPage:(NSUInteger)page pageSize:(NSUInteger)pageSize;

@end

NS_ASSUME_NONNULL_END
