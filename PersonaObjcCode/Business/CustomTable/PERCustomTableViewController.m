//
//  PERCustomTableViewController.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCustomTableViewController.h"
#import "PERCustomTableViewModel.h"
#import "PERCustomBannerCell.h"
#import "PERCustomListCell.h"

@interface PERCustomTableViewController ()<UISearchBarDelegate>

@property (nonatomic, strong, readonly) PERCustomTableViewModel *viewModel;

@end

@implementation PERCustomTableViewController
@dynamic viewModel;

- (NSArray *)supportedViewModelClasses {
    return @[PERCustomBannerCellViewModel.class, PERCustomListCellViewModel.class];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UISearchBar * searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 80, 44)];
    searchbar.delegate = self;
    [searchbar setTintColor:[UIColor grayColor]];
    [searchbar setPlaceholder:@"冰糖炖雪梨"];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchbar];
    self.navigationItem.rightBarButtonItem = searchButton;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"搜索");
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
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
