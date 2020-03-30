//
//  PERDemoViewController.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERDemoViewController.h"
#import "PERDemoViewModel.h"
#import "PERDemoViewCell.h"
#import "PERTextureViewController.h"

@interface PERDemoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) PERDemoViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PERDemoViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (void)makeConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PERDemoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PERDemoViewCell.class) forIndexPath:indexPath];
    PERDemoModel *model = self.viewModel.listArray[indexPath.row];
    [cell bindModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PERDemoModel *model = self.viewModel.listArray[indexPath.row];
    [self.viewModel.selectCommand execute:model];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableView *)tableView {
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = UIColorFromRGB(0xf3fffe);
    [_tableView registerClass:PERDemoViewCell.class forCellReuseIdentifier:NSStringFromClass(PERDemoViewCell.class)];
    
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
