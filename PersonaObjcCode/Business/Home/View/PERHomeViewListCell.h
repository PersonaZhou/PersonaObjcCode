//
//  PERHomeViewListCell.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERListViewController.h"
#import "PERHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@class PERHomeViewListCellViewModel;

@interface PERHomeViewListCell : UITableViewCell<PERViewProtocol>

- (void)bindViewModel:(PERHomeViewListCellViewModel<PERViewModelProtocol> *)viewModel;

@end


@interface PERHomeViewListCellViewModel : PERViewModel<PERListItemProtocol>

@property (nonatomic, strong) PERHomeListItem *item;

@end

NS_ASSUME_NONNULL_END
