//
//  PERNetwork+Texture.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetwork (Texture)

- (RACSignal *)fetchListWithPage:(NSUInteger)page pageSize:(NSUInteger)pageSize;

@end

NS_ASSUME_NONNULL_END
