//
//  PERMineViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERMineViewController.h"
#import "PERMineViewModel.h"

#import <AVKit/AVKit.h>

@interface PERMineViewController ()<AVPlayerViewControllerDelegate>

@property (nonatomic, strong, readonly) PERMineViewModel *viewModel;

@property (nonatomic, strong) AVPlayerViewController *playerController;

@property (nonatomic, strong) UIVisualEffectView *infoEffectView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *anaLabel;

@property (nonatomic, strong) UIVisualEffectView *logoutEffectView;
@property (nonatomic, strong) UIButton *logoutBtn;

@end

@implementation PERMineViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mine_bg_movie_3" ofType:@"MOV"]];
    self.playerController.player = [AVPlayer playerWithURL:url];
    [self.playerController.player play];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self replay];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.playerController.player pause];
}

- (BOOL)shouldShowNavigationBackBarButtonItem {
    return NO;
}

- (BOOL)shouldHidenBottomBarWhenPushed {
    return NO;
}

- (void)setupUI {
    [self addChildViewController:self.playerController];
    [self.view addSubview:self.playerController.view];
    
    [self.view addSubview:self.infoEffectView];
    [self.infoEffectView.contentView addSubview:self.avatarImageView];
    [self.infoEffectView.contentView addSubview:self.nicknameLabel];
    [self.infoEffectView.contentView addSubview:self.locationLabel];
    [self.infoEffectView.contentView addSubview:self.phoneLabel];
    [self.infoEffectView.contentView addSubview:self.anaLabel];
    
    [self.view addSubview:self.logoutEffectView];
    [self.logoutEffectView.contentView addSubview:self.logoutBtn];
}

- (void)makeConstraints {
    CGFloat bottom = kTabbarHeight;
    [self.playerController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.bottom.equalTo(@(-bottom));
    }];
    
    [self.infoEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.right.equalTo(@-12);
        make.height.equalTo(@200);
        make.top.equalTo(@15);
    }];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(self.avatarImageView.mas_right).offset(10);
        make.right.equalTo(@-10);
    }];;

    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nicknameLabel.mas_bottom).offset(10);
        make.left.equalTo(self.nicknameLabel.mas_left);
        make.right.equalTo(self.nicknameLabel.mas_right);
    }];

    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).offset(10);
        make.left.equalTo(self.nicknameLabel.mas_left);
        make.right.equalTo(self.nicknameLabel.mas_right);
    }];
    
    [self.anaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(20);
        make.height.mas_lessThanOrEqualTo(@60);
    }];
    
    [self.logoutEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.right.equalTo(@-12);
        make.height.equalTo(@50);
        make.bottom.equalTo(@(-20 - kTabbarHeight));
    }];
    
    [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)bindEvent {
    self.logoutBtn.rac_command = self.viewModel.logoutCommand;
    
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self replay];
    }];
}

- (void)replay {
    AVPlayerItem *item = self.playerController.player.currentItem;
    [item seekToTime:kCMTimeZero completionHandler:nil];
    [self.playerController.player play];
}

#pragma mark - lazy load

- (AVPlayerViewController *)playerController {
    if (_playerController) return _playerController;
    
    _playerController = [[AVPlayerViewController alloc] init];
    _playerController.showsPlaybackControls = NO;
    _playerController.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _playerController.view.userInteractionEnabled = NO;
    _playerController.delegate = self;
    
    return _playerController;
}

- (UIVisualEffectView *)infoEffectView {
    if (_infoEffectView) return _infoEffectView;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    _infoEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    _infoEffectView.layer.cornerRadius = 10;
    _infoEffectView.layer.masksToBounds = YES;
    
    return _infoEffectView;
}

- (UIImageView *)avatarImageView {
    if (_avatarImageView) return _avatarImageView;
    
    _avatarImageView = [UIImageView new];
    [_avatarImageView setImage:[UIImage imageNamed:self.viewModel.services.user.avatar]];
    _avatarImageView.layer.cornerRadius = 5;
    _avatarImageView.layer.masksToBounds = YES;
    
    return _avatarImageView;
}

- (UILabel *)nicknameLabel {
    if (_nicknameLabel) return _nicknameLabel;
    
    _nicknameLabel = [UILabel new];
    _nicknameLabel.font = [UIFont boldSystemFontOfSize:18];
    _nicknameLabel.text = self.viewModel.services.user.nickname;
    
    return _nicknameLabel;
}

- (UILabel *)phoneLabel {
    if (_phoneLabel) return _phoneLabel;
    
    _phoneLabel = [UILabel new];
    _phoneLabel.font = [UIFont boldSystemFontOfSize:15];
    _phoneLabel.text = self.viewModel.services.user.phone;
    
    return _phoneLabel;
}

- (UILabel *)locationLabel {
    if (_locationLabel) return _locationLabel;
    
    _locationLabel = [UILabel new];
    _locationLabel.font = [UIFont boldSystemFontOfSize:15];
    _locationLabel.text = self.viewModel.services.user.location;
    _locationLabel.numberOfLines = 0;
    
    return _locationLabel;
}

- (UILabel *)anaLabel {
    if (_anaLabel) return _anaLabel;
    
    _anaLabel = [UILabel new];
    _anaLabel.font = [UIFont systemFontOfSize:16];
    _anaLabel.text = self.viewModel.services.user.ana;
    _anaLabel.textColor = UIColorFromRGB(0x30302f);
    _anaLabel.numberOfLines = 0;
    
    return _anaLabel;
}

- (UIVisualEffectView *)logoutEffectView {
    if (_logoutEffectView) return _logoutEffectView;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _logoutEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    _logoutEffectView.layer.cornerRadius = 5;
    _logoutEffectView.layer.masksToBounds = YES;
    
    return _logoutEffectView;
}

- (UIButton *)logoutBtn {
    if (_logoutBtn) return _logoutBtn;
    
    _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_logoutBtn setBackgroundImage:[UIImage imageWithColor:UIColor.clearColor size:CGSizeMake(300, 50)] forState:UIControlStateNormal];
    [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logoutBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [_logoutBtn setTitleColor:UIColorFromRGB(0xc94456) forState:UIControlStateNormal];
    _logoutBtn.layer.cornerRadius = 5;
    _logoutBtn.layer.masksToBounds = YES;
    
    return _logoutBtn;
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
