//
//  PERCustomListCell.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERListViewController.h"
#import "PERCustomTableBannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@class PERCustomListCellViewModel;

@interface PERCustomListCell : UITableViewCell<PERViewProtocol>

- (void)bindViewModel:(PERCustomListCellViewModel<PERListItemProtocol> *)viewModel;

@end


@interface PERCustomListCellViewModel : PERViewModel<PERListItemProtocol>

@property (nonatomic, strong) PERCustomTableListItemModel *item;

@end

NS_ASSUME_NONNULL_END
