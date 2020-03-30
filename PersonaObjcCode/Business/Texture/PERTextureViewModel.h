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

// 加载数据
@property (nonatomic, strong, readonly) RACCommand *loadCommand;

// 保存表格数据的数组
@property (nonatomic, copy, readonly) NSArray *listArray;

@end

NS_ASSUME_NONNULL_END
