//
//  PERYogaViewController.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERYogaViewController.h"
#import "PERYogaViewModel.h"
#import "PERYogaUserInfoCell.h"
#import "PERYogaOptionCell.h"
#import "PERYogaInfoModel.h"
#import "PERYogaOptionModel.h"

#import <YogaKit/YGLayout.h>

@interface PERYogaViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) PERYogaViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PERYogaViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YogaKit";
}

- (void)buildNavigaterRightBtnItem {
    UIBarButtonItem *documentItem = [UIBarButtonItem documentButtonItemWithUrl:self.viewModel.documentUrl];
    self.navigationItem.rightBarButtonItems = @[documentItem];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (void)makeConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)bindEvent {
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIDeviceOrientationDidChangeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self.view.yoga applyLayoutPreservingOrigin:YES];
    }];
}

#pragma mark - tableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.viewModel.dataSource[indexPath.row];
    if ([model isKindOfClass:PERYogaInfoModel.class]) {
        PERYogaUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PERYogaUserInfoCell.class) forIndexPath:indexPath];
        PERYogaInfoModel *m = (PERYogaInfoModel *)model;
        [cell bindModel:m];
        return cell;
    }else if ([model isKindOfClass:PERYogaOptionModel.class]) {
        PERYogaOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PERYogaOptionCell.class) forIndexPath:indexPath];
        PERYogaOptionModel *m = (PERYogaOptionModel *)model;
        [cell bindModel:m];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.viewModel.dataSource[indexPath.row];
    if ([model isKindOfClass:PERYogaInfoModel.class]) {
        return 150;
    }else if ([model isKindOfClass:PERYogaOptionModel.class]) {
        return 60;
    }
    
    return 0;
}

- (UITableView *)tableView {
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = UIColorFromRGB(0xececec);
    [_tableView registerClass:PERYogaUserInfoCell.class forCellReuseIdentifier:NSStringFromClass(PERYogaUserInfoCell.class)];
    [_tableView registerClass:PERYogaOptionCell.class forCellReuseIdentifier:NSStringFromClass(PERYogaOptionCell.class)];
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    
    return _tableView;
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
