//
//  PERHomeViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERHomeViewController.h"
#import "PERHomeViewModel.h"
#import "PERHomeViewBannerCell.h"
#import "PERHomeViewListCell.h"

@interface PERHomeViewController ()

@property (nonatomic, strong, readonly) PERHomeViewModel *viewModel;

@end

@implementation PERHomeViewController
@dynamic viewModel;

- (NSArray *)supportedViewModelClasses {
    return @[PERHomeViewBannerCellViewModel.class, PERHomeViewListCellViewModel.class];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = UIColorFromRGB(0xf0f0f0);
}

- (BOOL)shouldShowNavigationBackBarButtonItem {
    return NO;
}

- (BOOL)shouldHidenBottomBarWhenPushed {
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
