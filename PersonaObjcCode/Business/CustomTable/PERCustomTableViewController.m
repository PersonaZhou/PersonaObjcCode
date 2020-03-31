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
}

- (void)buildNavigaterRightBtnItem {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width -130, 44)];
    searchBar.delegate = self;
    [searchBar setTintColor:[UIColor grayColor]];
    [searchBar setPlaceholder:@"冰糖炖雪梨"];
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
    
    UIBarButtonItem *documentItem = [UIBarButtonItem documentButtonItemWithUrl:self.viewModel.documentUrl];
    
    self.navigationItem.rightBarButtonItems = @[documentItem, searchBarItem];
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
