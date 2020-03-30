//
//  PERDetailViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERDetailViewController.h"
#import "PERDetailViewModel.h"

@interface PERDetailViewController ()

@property (nonatomic, strong, readonly) PERDetailViewModel *viewModel;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation PERDetailViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.viewModel.title;
}

- (void)setupUI {
    [self.view addSubview:self.contentLabel];
}

- (void)makeConstraints {
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 0));
    }];
}

- (UILabel *)contentLabel {
    if (_contentLabel) return _contentLabel;
    
    _contentLabel = [UILabel new];
    _contentLabel.text = @"小说正文省略了几十万字.....";
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.font = [UIFont boldSystemFontOfSize:22];
    
    return _contentLabel;
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
