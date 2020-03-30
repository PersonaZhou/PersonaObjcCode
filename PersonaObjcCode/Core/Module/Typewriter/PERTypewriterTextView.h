//
//  PERTypewriterTextView.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^PERTypewriterInputFinishBlock)(void);

@interface PERTypewriterTextView : UITextView

/* 打字间隔时间，默认0.3秒*/
@property (nonatomic) NSTimeInterval interval;

/* 起始位置 */
@property (nonatomic) NSUInteger startIndex;

/* 输入完成block */
@property (nonatomic, copy) PERTypewriterInputFinishBlock inputFinishBlock;

/* 显示文案 */
@property (nonatomic, copy) NSString *content;

/* 开始输入 */
- (void)startInput;

@end

NS_ASSUME_NONNULL_END
