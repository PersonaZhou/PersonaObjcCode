//
//  PERViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERViewController.h"

@interface PERViewController ()

@property (nonatomic, strong, readwrite) id<PERViewModelProtocol> viewModel;

@end

@implementation PERViewController

- (instancetype)initWithViewModel:(id<PERViewModelProtocol>)viewModel {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.viewModel = viewModel;
        
        if ([self shouldHidenBottomBarWhenPushed]) {
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PERLogD(@"ENTER VC : %@",NSStringFromClass(self.class));
    
    self.view.backgroundColor = UIColorFromRGB(0xfafcfc);
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if ([self shouldShowNavigationBackBarButtonItem]) {
        [self buildNavigaterBackBtnItem];
    }
    
    [self setupUI];
    [self makeConstraints];
    [self bindEvent];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    PERLogD(@"DEALLOC VC : %@",NSStringFromClass(self.class));
}

- (void)setupUI {
    
}

- (void)makeConstraints {
    
}

- (void)bindEvent {
    
}

- (BOOL)popToRootViewController {
    return NO;
}

- (BOOL)shouldShowNavigationBackBarButtonItem {
    return YES;
}

- (BOOL)shouldHidenBottomBarWhenPushed {
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)buildNavigaterBackBtnItem {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.bounds = CGRectMake(0, 0, 15, 20);
    leftButton.backgroundColor =[UIColor clearColor];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    
    @weakify(self);
    leftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButton;
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
