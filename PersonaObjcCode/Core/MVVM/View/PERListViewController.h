//
//  PERListViewController.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PERListItemProtocol

@optional

- (CGFloat)height;

+ (nullable UINib *)nib;

+ (nullable Class)cellClass;

@end


@protocol PERNetworkErrorTipViewProtocol <NSObject>

@property (nonatomic, readonly, nonnull) RACSignal *retrySignal;

@end




@interface PERListViewController: PERViewController

@property (nonatomic, strong, nonnull) UITableView *tableView;

/**
 *  支持的ViewModel类型，子类重载该方法，确定列表支持的ViewModel类型，默认返回nil
 *
 *  @return 支持的ViewModel类型数组
 */
- (nullable NSArray *)supportedViewModelClasses;

/**
 *  无数据提示页，子类可重载，默认为nil
 *
 */
- (nullable UIView *)emptyTipView;

/**
 *  网络错误提示页，子类可重载，默认页面可点击重试
 *
 */
- (nullable UIView<PERNetworkErrorTipViewProtocol> *) networkErrorTipView;

@end

NS_ASSUME_NONNULL_END
