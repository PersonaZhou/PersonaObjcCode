//
//  UIAlertController+Utility.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "UIAlertController+Utility.h"

@implementation UIAlertController (Utility)

+ (void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message urls:(NSArray<PERUrlModel *> *)urls {
    if (!urls || urls.count == 0) return;
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (PERUrlModel *model in urls) {
        if ([model isKindOfClass:PERUrlModel.class]) {
            if (model.title.length > 0 && model.url > 0) {
                UIAlertAction *action = [UIAlertAction actionWithTitle:model.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [WKWebView openUrl:model.url];
                }];
                [sheet addAction:action];
            }
        }
    }
    
    UIAlertAction *cancel_action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [sheet addAction:cancel_action];
    
    UIViewController *vc = [UIViewController getCurrentVC];
    
    [vc presentViewController:sheet animated:YES completion:nil];
}

@end
