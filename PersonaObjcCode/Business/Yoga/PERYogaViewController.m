//
//  PERYogaViewController.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERYogaViewController.h"
#import "PERYogaViewModel.h"

#import <YogaKit/YGLayout.h>

@interface PERYogaViewController ()

@property (nonatomic, strong) PERYogaViewModel *viewModel;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIView *infoView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *emailLabel;

@end

@implementation PERYogaViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YogaKit";
    [self setupView];
    [self makeFlexBox];
    [self bindEvent];
}

- (void)buildNavigaterRightBtnItem {
    UIBarButtonItem *documentItem = [UIBarButtonItem documentButtonItemWithUrl:self.viewModel.documentUrl];
    self.navigationItem.rightBarButtonItems = @[documentItem];
}

- (void)setupView {
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.avatarImageView];
    [self.headerView addSubview:self.infoView];
    [self.infoView addSubview:self.nicknameLabel];
    [self.infoView addSubview:self.addressLabel];
    [self.infoView addSubview:self.emailLabel];
}

- (void)makeFlexBox {
    [self.view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignFlexStart;
    }];
    
    [self.headerView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection = YGFlexDirectionRow;
        layout.height = YGPointValue(120);
        layout.top = YGPointValue(10);
        layout.marginLeft = YGPointValue(12);
        layout.marginRight = YGPointValue(12);
        layout.padding =  YGPointValue(10);
        layout.flexGrow = 2;
    }];
    
    [self.infoView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = true;
        layout.flexGrow = 10;
        layout.padding = YGPointValue(5);
        layout.flexDirection = YGFlexDirectionColumn;
        layout.marginLeft = YGPointValue(5);
    }];
    
    [self.avatarImageView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(60);
        layout.height = YGPointValue(60);
    }];
    
    [self.nicknameLabel configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.height = YGPointValue(20);
        layout.top = YGPointValue(5);
        layout.marginBottom = YGPointValue(10);
    }];
    
    [self.addressLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(5);
    }];
    
    [self.emailLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(5);
    }];
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void)bindEvent {
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIDeviceOrientationDidChangeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self.view.yoga applyLayoutPreservingOrigin:YES];
    }];
}

- (UIView *)headerView {
    if (_headerView) return _headerView;
    
    _headerView = UIView.new;
    _headerView.backgroundColor = UIColorFromRGB(0xf3fffe);
    _headerView.layer.borderColor = UIColorFromRGB(0x2a2d29).CGColor;
    _headerView.layer.borderWidth = 1;
    
    return _headerView;
}

- (UIImageView *)avatarImageView {
    if(_avatarImageView) return _avatarImageView;
    
    _avatarImageView = UIImageView.new;
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2691192052,1821244895&fm=26&gp=0.jpg"]];
    _avatarImageView.layer.cornerRadius = 5;
    _avatarImageView.layer.masksToBounds = YES;
    _avatarImageView.layer.borderWidth = 1;
    _avatarImageView.layer.borderColor = UIColorFromRGB(0x7b7c77).CGColor;
    
    return _avatarImageView;
}

- (UIView *)infoView {
    if (_infoView) return _infoView;
    
    _infoView = UIView.new;
    _infoView.backgroundColor = UIColorFromRGB(0xc5cfce);
    
    return _infoView;
}

- (UILabel *)nicknameLabel {
    if (_nicknameLabel) return _nicknameLabel;
    
    _nicknameLabel = UILabel.new;
    _nicknameLabel.text = @"蕊希";
    _nicknameLabel.font = [UIFont boldSystemFontOfSize:18];
    
    return _nicknameLabel;
}

- (UILabel *)addressLabel {
    if (_addressLabel) return _addressLabel;
    
    _addressLabel = UILabel.new;
    _addressLabel.text = @"成都市高新区XXXX电台";
    _addressLabel.font = [UIFont systemFontOfSize:15];
    
    return _addressLabel;
}

- (UILabel *)emailLabel {
    if (_emailLabel) return _emailLabel;
    
    _emailLabel = UILabel.new;
    _emailLabel.text = @"ruixi@126.com";
    _emailLabel.font = [UIFont systemFontOfSize:15];
    
    return _emailLabel;
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
