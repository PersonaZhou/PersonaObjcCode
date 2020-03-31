//
//  PERNetwork+CustomTableMock.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNetwork (CustomTableMock)

- (RACSignal *)fetchCustomTableBanner:(NSDictionary *)parameters;

- (RACSignal *)fetchCustomTableList:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
