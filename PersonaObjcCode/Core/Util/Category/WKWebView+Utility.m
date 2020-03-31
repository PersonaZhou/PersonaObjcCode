//
//  WKWebView+Utility.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "WKWebView+Utility.h"

@implementation WKWebView (Utility)

+ (void)openUrl:(NSString *)url {
    AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:url];
    webVC.showsToolBar = YES;
    webVC.navigationController.navigationBar.translucent = NO;
    
    UIViewController *currentVC = [UIViewController getCurrentVC];
    [currentVC presentViewController:webVC animated:YES completion:nil];
}

@end
