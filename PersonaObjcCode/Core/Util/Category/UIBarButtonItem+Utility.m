//
//  UIBarButtonItem+Utility.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/30.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "UIBarButtonItem+Utility.h"

@implementation UIBarButtonItem (Utility)

+ (UIBarButtonItem *)documentButtonItemWithUrl:(NSString *)url {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 40, 40);
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [button setTitleColor:UIColorFromRGB(0xfdb76b) forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"nav_document"] forState:UIControlStateNormal];
    [button setTitle:@"文档" forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 14, 18, 14)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(25, -20, 0, 0)];
    
    button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        if (!url || url.length == 0) {
            UIViewController *currentVC = [UIViewController getCurrentVC];
            [currentVC.view makeToast:@"抱歉哦~ 暂未添加文档" duration:1 position:CSToastPositionCenter];
            return [RACSignal empty];
        }
        
        [WKWebView openUrl:url];
        return [RACSignal empty];
    }];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return buttonItem;
}

@end
