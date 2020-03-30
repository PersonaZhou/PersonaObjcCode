//
//  PERRecordView.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/30.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERRecordModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERRecordView : UIView

- (void)updateData:(NSArray<PERRecordModel *> *)data;

@end

NS_ASSUME_NONNULL_END
