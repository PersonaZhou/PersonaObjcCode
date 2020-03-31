//
//  PERYogaViewModel.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERYogaViewModel.h"
#import "PERYogaInfoModel.h"
#import "PERYogaOptionModel.h"

@implementation PERYogaViewModel
@synthesize dataSource = _dataSource;

- (NSString *)documentUrl {
    return @"https://zhoushisong.cn/2019/09/01/YogaKit(Flexbox)/";
}

- (NSArray *)dataSource {
    if (_dataSource) return _dataSource;
    
    PERYogaInfoModel *info = PERYogaInfoModel.new;
    info.avatar = @"iu";
    info.nickname = @"测试用户";
    info.address = @"成都市高新区天府软件园";
    info.email = @"test_user@163.com";
    
    PERYogaOptionModel *option1 = PERYogaOptionModel.new;
    option1.icon = @"yoga_vip";
    option1.title = @"超级会员";
    
    PERYogaOptionModel *option2 = PERYogaOptionModel.new;
    option2.icon = @"yoga_wallet";
    option2.title = @"我的钱包";
    
    PERYogaOptionModel *option3 = PERYogaOptionModel.new;
    option3.icon = @"yoga_draw";
    option3.title = @"个性装扮";
    
    PERYogaOptionModel *option4 = PERYogaOptionModel.new;
    option4.icon = @"yoga_collect";
    option4.title = @"我的收藏";
    
    PERYogaOptionModel *option5 = PERYogaOptionModel.new;
    option5.icon = @"yoga_photo";
    option5.title = @"我的相册";
    
    PERYogaOptionModel *option6 = PERYogaOptionModel.new;
    option6.icon = @"yoga_file";
    option6.title = @"我的文件";
    
    PERYogaOptionModel *option7 = PERYogaOptionModel.new;
    option7.icon = @"yoga_signal";
    option7.title = @"免流量特权";
    
    _dataSource = @[info, option1, option2, option3, option4, option5, option6, option7];
    
    return _dataSource;
}

@end
