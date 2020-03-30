//
//  PERListViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERListViewController.h"
#import "PERListViewModel.h"

@interface PERListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readonly) PERListViewModel *viewModel;

@property (nonatomic, strong, readonly) NSArray *gitHeaderImageArray;

@end

@implementation PERListViewController {
    UIView *_emptyTipViewPrivate;
    UIView<PERNetworkErrorTipViewProtocol> *_networkErrorTipViewPrivate;
}
@synthesize gitHeaderImageArray = _gitHeaderImageArray;
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithRed:0.929 green:0.929 blue:0.929 alpha:1.00];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:self.tableView];
    
    [self registerCellClasses];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    @weakify(self);
    [self.viewModel.sourceSignal subscribeNext:^(NSArray *models) {
        @strongify(self);
        [self showEmptyTipyView:(models && models.count == 0)];
        [self.tableView reloadData];
    }];
    
    /*
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self.viewModel.loadCommand execute:nil];
    }];
    
    [gifHeader setImages:self.gitHeaderImageArray forState:MJRefreshStateIdle];
    [gifHeader setImages:self.gitHeaderImageArray forState:MJRefreshStatePulling];
    [gifHeader setImages:self.gitHeaderImageArray forState:MJRefreshStateRefreshing];
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    gifHeader.stateLabel.hidden = YES;
    
    table.mj_header = gifHeader;
     */
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.loadCommand execute:nil];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.loadMoreCommand execute:nil];
    }];
    
    // 隐藏上拉刷新文字
    [(MJRefreshAutoNormalFooter *)self.tableView.mj_footer setRefreshingTitleHidden:YES];
    
    [self.viewModel.loadCommand.executing subscribeNext:^(NSNumber *x) {
        @strongify(self);
        if (x.boolValue) {
            // 仅在tableview无数据时显示loading
            if (self.viewModel.models.count == 0) {
                [self.view showLoading];
            }
        } else {
            [self.tableView.mj_header endRefreshing];
            [self.view hideLoading];
        }
        
        self.tableView.mj_footer.hidden = !self.viewModel.hasMoreData;
    }];
    
    [[self.viewModel.loadMoreCommand executing] subscribeNext:^(NSNumber *x) {
        @strongify(self);
        if (!x.boolValue) {
            [self.tableView.mj_footer endRefreshing];
        }
        
        self.tableView.mj_footer.hidden = !self.viewModel.hasMoreData;
    }];
    
    [[self.viewModel.loadCommand errors] subscribeNext:^(NSError *x) {
        @strongify(self);
        [self.view showErrorToast:x duration:2];
        [self showNetworkErrorTipView:YES];
    }];
    
    [[self.viewModel.loadMoreCommand errors] subscribeNext:^(NSError *x) {
        @strongify(self);
        [self.view showErrorToast:x duration:2];
    }];
    
    [self.viewModel.loadCommand execute:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat h = 44;
    PERViewModel<PERListItemProtocol> *vm = [self.viewModel.models objectAtIndex:indexPath.row];
    if ([vm respondsToSelector:@selector(height)]) {
        h = [vm height];
    }
    
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PERViewModel<PERListItemProtocol> *vm = [self.viewModel.models objectAtIndex:indexPath.row];
    
    UITableViewCell<PERTableViewCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(vm.class)];
    assert(cell);
    if ([cell conformsToProtocol:@protocol(PERTableViewCellProtocol)]) {
        cell.indexPath = indexPath;
        
        if ([cell respondsToSelector:@selector(setTotal:)]) {
            cell.total = self.viewModel.models.count;
        }
    }
    
    [cell bindViewModel:[self.viewModel.models objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel.selectCommand execute:[self.viewModel.models objectAtIndex:indexPath.row]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (nullable NSArray *)supportedViewModelClasses {
    return nil;
}

- (nullable UIView *)emptyTipView {
    return nil;
}

- (nullable UIView<PERListItemProtocol> *)networkErrorTipView {
    //TODO 返回网络错误的视图
    return nil;
}

- (void)showEmptyTipyView:(BOOL)show {
    // 有数据时，不创建该空数据提示页面
    if (!show && !_emptyTipViewPrivate) {
        return;
    }
    
    if (!_emptyTipViewPrivate) {
        _emptyTipViewPrivate = [self emptyTipView];
        [self.view addSubview:_emptyTipViewPrivate];
        [_emptyTipViewPrivate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
        }];
    }
    
    _emptyTipViewPrivate.hidden = !show;
}

- (void)showNetworkErrorTipView:(BOOL)show {
    // 没有网络错误时，不创建网络错误提示页
    if (!show && !_networkErrorTipViewPrivate) return;
    
    if (!_networkErrorTipViewPrivate) {
        _networkErrorTipViewPrivate = [self networkErrorTipView];
        [self.view addSubview:_networkErrorTipViewPrivate];
        [_networkErrorTipViewPrivate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
        }];
        
        @weakify(self);
        [_networkErrorTipViewPrivate.retrySignal subscribeNext:^(id x) {
            @strongify(self);
            self -> _networkErrorTipViewPrivate.hidden = YES;
            [self.viewModel.loadCommand execute:nil];
        }];
    }
    _networkErrorTipViewPrivate.hidden = !show;
}

#pragma mark - private
- (void)registerCellClasses {
    for (Class vmClass in [self supportedViewModelClasses]) {
        assert([vmClass isSubclassOfClass:[PERViewModel class]]);
        assert([vmClass conformsToProtocol:@protocol(PERListItemProtocol)]);
        NSString *k = NSStringFromClass(vmClass);
        
        Class cls = object_getClass(vmClass);
        if (class_respondsToSelector(cls, @selector(nib))) {
            UINib *nib = [vmClass nib];
            if (nib) {
                [self.tableView registerNib:nib forCellReuseIdentifier:k];
                continue;
            }
        }
        
        if (class_respondsToSelector(cls, @selector(cellClass))) {
            Class cls = [vmClass cellClass];
            if (cls) {
                [self.tableView registerClass:cls forCellReuseIdentifier:k];
                continue;
            }
        }
        
        assert(0);
    }
}

- (NSArray *)gitHeaderImageArray {
    if(_gitHeaderImageArray) return _gitHeaderImageArray;
    
    _gitHeaderImageArray = @[[UIImage imageNamed:@"loading_1"],
                             [UIImage imageNamed:@"loading_2"],
                             [UIImage imageNamed:@"loading_3"],
                             [UIImage imageNamed:@"loading_4"]];
    
    return _gitHeaderImageArray;
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
