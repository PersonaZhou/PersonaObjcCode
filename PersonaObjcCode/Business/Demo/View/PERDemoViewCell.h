//
//  PERDemoViewCell.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERDemoViewCell : UITableViewCell

- (void)bindModel:(PERDemoModel *)model;

@end

NS_ASSUME_NONNULL_END
