//
//  PERYogaUserInfoCell.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERYogaInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERYogaUserInfoCell : UITableViewCell

- (void)bindModel:(PERYogaInfoModel *)model;

@end

NS_ASSUME_NONNULL_END
