//
//  PERCustomBannerCell.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERListViewController.h"
#import "PERCustomTableBannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@class PERCustomBannerCellViewModel;

@interface PERCustomBannerCell : UITableViewCell<PERViewProtocol>

- (void)bindViewModel:(PERCustomBannerCellViewModel<PERListItemProtocol> *)viewModel;

@end

@interface PERCustomBannerCellViewModel : PERViewModel<PERListItemProtocol>

@property (nonatomic, copy) NSArray<PERCustomTableBannerModel *> *banners;

@end

NS_ASSUME_NONNULL_END
