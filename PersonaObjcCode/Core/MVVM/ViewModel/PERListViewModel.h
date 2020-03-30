//
//  PERListViewModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERListViewModel: PERViewModel

@property (nonatomic, strong, nullable) NSArray *models;

/**
 *  models改变通知信号
 */
@property (nonatomic, strong, readonly, nonnull) RACSignal *sourceSignal;

/**
 *  数据加载信号
 */
@property (nonatomic, strong, readonly, nonnull) RACCommand *loadCommand;

/**
 *  加载更多数据信号
 */
@property (nonatomic, strong, readonly, nonnull) RACCommand *loadMoreCommand;

/**
 *  是否有更多数据可以加载
 */
@property (nonatomic, readonly) BOOL hasMoreData;

/**
 *  选择Cell命令，信号输入 models[indexPath.row], 可以不实现，默认返回nil
 */
@property (nonatomic, readonly, nullable) RACCommand *selectCommand;


/**
 *  加载数据信号. 子类重载，用来加载真实数据；默认返回空信号
 *
 *  @param page    起始页
 *  @param perPage 每页条数
 *
 *  @return 数据加载信号
 */
- (nonnull RACSignal *)loadDataFromPage:(NSUInteger)page perPage:(NSUInteger)perPage;

- (BOOL)deleteModelAtIndex:(NSUInteger)index;

- (void)removeAllModels;


@end

NS_ASSUME_NONNULL_END
