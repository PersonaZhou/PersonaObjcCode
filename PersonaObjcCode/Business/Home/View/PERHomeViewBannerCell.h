//
//  PERHomeViewBannerCell.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERListViewController.h"
#import "PERHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@class PERHomeViewBannerCellViewModel;

@interface PERHomeViewBannerCell : UITableViewCell<PERViewProtocol>

- (void)bindViewModel:(PERHomeViewBannerCellViewModel<PERViewModelProtocol> *)viewModel;

@end


@interface PERHomeViewBannerCellViewModel : PERViewModel<PERListItemProtocol>

@property (nonatomic, copy) NSArray<PERHomeListItem *> *banners;

@end

NS_ASSUME_NONNULL_END
