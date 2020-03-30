//
//  PERLoginViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERLoginViewController.h"
#import "UIImage+Utility.h"
#import "NSString+Utility.h"
#import "PERLoginViewModel.h"
#import "PERTypewriterTextView.h"

#define THIS_VM ((PERLoginViewModel *)self.viewModel)

@interface PERLoginViewController ()

@property (nonatomic, strong, readonly) PERLoginViewModel *viewModel;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) PERTypewriterTextView *typewriterTextView;
@property (nonatomic, strong) UIView *usernameView;
@property (nonatomic, strong) UIImageView *usernameImageView;
@property (nonatomic, strong) UITextField *usernameTextfield;
@property (nonatomic, strong) UIView *codeView;
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UITextField *codeTextfield;
@property (nonatomic, strong) UIButton *fetchCodeBtn;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation PERLoginViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)shouldShowNavigationBackBarButtonItem {
    return NO;
}

- (void)bindEvent {
    // 绑定数据
    RACChannelTo(self.usernameTextfield, text) = RACChannelTo(self.viewModel, phone);
    RACChannelTo(self.codeTextfield, text) = RACChannelTo(self.viewModel, code);
    
    // 限制输入长度
    RACSignal<NSString *> *usernameSignal = self.usernameTextfield.rac_textSignal;
    RAC(self.usernameTextfield, text) = [usernameSignal map:^id _Nullable(NSString * _Nullable value) {
        return value.length > 11 ? [value substringToIndex:11] : value;
    }];
    
    self.usernameTextfield.text = @"18202888888";
    
    RACSignal<NSString *> *codeSignal = self.codeTextfield.rac_textSignal;
    RAC(self.codeTextfield, text) = [codeSignal map:^id _Nullable(NSString * _Nullable value) {
        return value.length > 6 ? [value substringToIndex:6] : value;
    }];
    
    // 验证手机号和验证码的输入是否符合条件
    RACSignal<NSNumber *> *phoneNumberValidSignal = [usernameSignal map:^id _Nullable(NSString * _Nullable value) {
        return @([value validateMobile]);
    }];
    
    RAC(self.fetchCodeBtn, enabled) = phoneNumberValidSignal;
    
    RACSignal<NSNumber *> *codeValidSignal = [codeSignal map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length == 6);
    }];
    
    RACSignal *validSignal = [RACSignal combineLatest:@[phoneNumberValidSignal, codeValidSignal] reduce:^(NSNumber *phoneNumberValide, NSNumber *codeValide){
        return @(phoneNumberValide.boolValue && codeValide.boolValue);
    }];

    RAC(self.loginBtn, enabled) = validSignal;
    
    // 接口请求
    @weakify(self);
    [[self.fetchCodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.viewModel.fetchCodeCommand execute:@1];
    }];
    
    /** 切记：如果按照下面👇这样写会崩溃：原因是 一个对象只能绑定一个RACDynamicSignal的信号
    RAC(self.loginBtn , enabled) = self.viewModel.validLoginSignal;
    self.loginBtn.rac_command = self.viewModel.loginCommand;
    2020-01-04 15:07:37.940310+0800 PersonaObjcCode[34522:320601] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Signal <RACDynamicSignal: 0x600001fd4260> name:  is already bound to key path "enabled" on object <UIButton: 0x7fa13ee21460; frame = (0 0; 0 0); clipsToBounds = YES; opaque = NO; layer = <CALayer: 0x600001fda720>>, adding signal <RACReplaySubject: 0x600000a0d280> name:  is undefined behavior'
     */
//    self.loginBtn.rac_command = self.viewModel.loginCommand;
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:nil];
    }];
    
    [self bindFetchCodeCommand];
    [self bindLoginCommand];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 2;
    [self.typewriterTextView addGestureRecognizer:tap];
    
    [tap.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        @strongify(self);
        [self.typewriterTextView startInput];
    }];
    
    [self.typewriterTextView startInput];
}

- (void)bindFetchCodeCommand {
    @weakify(self);
    [[self.viewModel.fetchCodeCommand executing] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        if(x.boolValue) {
            [self.view showLoading];
        }else {
            [self.view hideLoading];
        }
    }];
    
    [[[self.viewModel.fetchCodeCommand executionSignals] switchToLatest] subscribeNext:^(NSDictionary *x) {
        @strongify(self);
        if ([[x objectForKey:@"status"] boolValue]) {
            [self.view showToast:[x objectForKey:@"message"] duration:2];
            [self startCountDown];
        }
    }];
    
    [[self.viewModel.fetchCodeCommand errors] subscribeNext:^(NSError * _Nullable x) {
        @strongify(self);
        [self.view showErrorToast:x duration:2];
    }];
}

- (void)bindLoginCommand {
    @weakify(self);
    [self.viewModel.loginCommand.executionSignals subscribeNext:^(RACSignal *loginSignal) {
        @strongify(self);
        [self.view showLoading];
        [[loginSignal dematerialize] subscribeNext:^(id  _Nullable x) {
            
        } error:^(NSError * _Nullable error) {
            @strongify(self);
            [self.view showErrorToast:error duration:2];
            [self.view hideLoading];
        } completed:^{
            @strongify(self);
            [self.view hideLoading];
        }];
    }];
}

- (void)startCountDown {
    __block NSInteger second = 0.f;
    NSInteger duration = 30.f;
    @weakify(self);
    [[[[RACSignal interval:1.0 onScheduler:RACScheduler.mainThreadScheduler] take:duration] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSDate * _Nullable x) {
        @strongify(self);
        NSString *sec = [NSString stringWithFormat:@"%ld%@", duration - second, @"s"];
        [self.fetchCodeBtn setTitle:sec forState:UIControlStateNormal];
        second++;
    } completed:^{
        @strongify(self);
        [self.fetchCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }];
}

- (void)setupUI {
    [self.view addSubview:self.imageView];
    [self.imageView addSubview:self.typewriterTextView];
    [self.view addSubview:self.usernameView];
    [self.usernameView addSubview:self.usernameImageView];
    [self.usernameView addSubview:self.usernameTextfield];
    [self.view addSubview:self.codeView];
    [self.codeView addSubview:self.codeImageView];
    [self.codeView addSubview:self.codeTextfield];
    [self.view addSubview:self.fetchCodeBtn];
    [self.view addSubview:self.loginBtn];
}

- (void)makeConstraints {
    float imageView_w = 720 / 1080.0 * UIScreen.mainScreen.bounds.size.width;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(imageView_w));
    }];
    
    [self.typewriterTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(180, 90));
        make.centerX.equalTo(@3);
        make.bottom.equalTo(@-90);
    }];
    
    [self.usernameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(50);
        make.right.equalTo(@-12);
        make.left.equalTo(@12);
        make.height.equalTo(@45);
    }];
    
    [self.usernameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.centerY.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(15, 21));
    }];
    
    [self.usernameTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(@0);
        make.left.equalTo(@40);
    }];
    
    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameView.mas_bottom).offset(20);
        make.left.equalTo(@12);
        make.height.equalTo(@45);
    }];
    
    [self.codeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.centerY.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(15, 17));
    }];
    
    [self.codeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(@0);
        make.left.equalTo(@40);
    }];

    [self.fetchCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.codeView.mas_right).offset(10);
        make.centerY.equalTo(self.codeView);
        make.size.mas_equalTo(CGSizeMake(90, 45));
        make.right.equalTo(@-12);
    }];

    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@12);
        make.right.equalTo(@-12);
        make.top.equalTo(self.fetchCodeBtn.mas_bottom).offset(30);
        make.height.equalTo(@50);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UIImageView *)imageView {
    if (_imageView) return _imageView;
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_mac"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.userInteractionEnabled = YES;
    
    return _imageView;
}

- (PERTypewriterTextView *)typewriterTextView {
    if (_typewriterTextView) return _typewriterTextView;
    
    _typewriterTextView = PERTypewriterTextView.new;
    _typewriterTextView.font = [UIFont boldSystemFontOfSize:13];
    _typewriterTextView.textColor = UIColorFromRGB(0xffffff);
    _typewriterTextView.backgroundColor = UIColor.clearColor;
    _typewriterTextView.textAlignment = NSTextAlignmentCenter;
    _typewriterTextView.editable = NO;
    _typewriterTextView.interval = 0.2;
    _typewriterTextView.content = @"请输入任意6位数字验证码后点击登录\n\nThanks♪(･ω･)ﾉ";
    _typewriterTextView.inputFinishBlock = ^{
        NSLog(@"input finish!");
    };
    
    return _typewriterTextView;
}

- (UIView *)usernameView {
    if (_usernameView) return _usernameView;
    
    _usernameView = UIView.new;
    _usernameView.layer.borderColor = UIColorFromRGB(0xbfc9c8).CGColor;
    _usernameView.layer.borderWidth = 1;
    _usernameView.layer.cornerRadius = 5;
    
    return _usernameView;
}

- (UIImageView *)usernameImageView {
    if (_usernameImageView) return _usernameImageView;
    
    _usernameImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_phone"]];
    
    return _usernameImageView;
}

- (UITextField *)usernameTextfield {
    if (_usernameTextfield) return _usernameTextfield;
    
    _usernameTextfield = [UITextField new];
    _usernameTextfield.placeholder = @"请输入手机号";
    _usernameTextfield.keyboardType = UIKeyboardTypeNumberPad;
    
    return _usernameTextfield;
}

- (UIView *)codeView {
    if (_codeView) return _codeView;
    
    _codeView = UIView.new;
    _codeView.layer.borderColor = UIColorFromRGB(0xbfc9c8).CGColor;
    _codeView.layer.borderWidth = 1;
    _codeView.layer.cornerRadius = 5;
    
    return _codeView;
}

- (UIImageView *)codeImageView {
    if (_codeImageView) return _codeImageView;
    
    _codeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_password"]];
    
    return _codeImageView;
}

- (UITextField *)codeTextfield {
    if (_codeTextfield) return _codeTextfield;
    
    _codeTextfield = [UITextField new];
    _codeTextfield.placeholder = @"请输入验证码";
    _codeTextfield.keyboardType = UIKeyboardTypeNumberPad;
    
    return _codeTextfield;
}

- (UIButton *)fetchCodeBtn {
    if (_fetchCodeBtn) return _fetchCodeBtn;
    
    _fetchCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fetchCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_fetchCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    UIImage *img = [UIImage imageWithColor:UIColorFromRGB(0xc98386) size:CGSizeMake(80, 50)];
    [_fetchCodeBtn setBackgroundImage:img forState:UIControlStateNormal];
    _fetchCodeBtn.layer.cornerRadius = 5;
    _fetchCodeBtn.layer.masksToBounds = YES;
    
    return _fetchCodeBtn;
}

- (UIButton *)loginBtn {
    if (_loginBtn) return _loginBtn;
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    UIImage *img = [UIImage imageWithColor:UIColorFromRGB(0x7b90f8) size:CGSizeMake(200, 50)];
    [_loginBtn setBackgroundImage:img forState:UIControlStateNormal];
    _loginBtn.layer.cornerRadius = 5;
    _loginBtn.layer.masksToBounds = YES;
    
    return _loginBtn;
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
