//
//  PERTextureViewController.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/19.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureViewController.h"
#import "PERTextureViewModel.h"
#import "PERTextureCellNode.h"

@interface PERTextureViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong, readonly) PERTextureViewModel *viewModel;

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation PERTextureViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Texture";
    [self setupNode];
}

- (void)setupNode {
    [self.view addSubnode:self.tableNode];
}

- (void)bindEvent {
    @weakify(self);
    [[self.viewModel.loadCommand execute:nil] subscribeNext:^(NSArray *x) {
        @strongify(self);
        [self.tableNode reloadData];
    }];
    
    [[[self.viewModel.loadCommand executing] skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        if(x.boolValue) {
            [self.view showLoading];
        }else {
            [self.view hideLoading];
        }
    }];
    
    [[self.viewModel.loadCommand errors] subscribeNext:^(NSError * _Nullable x) {
        @strongify(self);
        [self.view showErrorToast:x duration:2];
    }];
}

#pragma mark - tableNode delegate

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    return 1;
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.listArray.count;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    PERTextureCellNode *node = [[PERTextureCellNode alloc] init];
    PERTextureModel *texture = self.viewModel.listArray[indexPath.row];
    [node bindModel:texture];
    return node;
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
}

- (ASTableNode *)tableNode {
    if (_tableNode) return _tableNode;
    
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    float x = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    _tableNode.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - x);
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.showsVerticalScrollIndicator = NO;
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return _tableNode;
}

@end
