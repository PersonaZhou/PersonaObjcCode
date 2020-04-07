//
//  PERTextureViewModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/19.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERTextureViewModel : PERViewModel

@property (nonatomic, strong, readonly) RACCommand *loadCommand; // 加载数据接口

@property (nonatomic, copy, readonly) NSArray *listArray; // 保存表格数据的数组

@property (nonatomic, copy) NSString *documentUrl; // 文档URL

@end

NS_ASSUME_NONNULL_END
