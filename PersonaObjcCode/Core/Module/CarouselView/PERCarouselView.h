//
//  PERCarouselView.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PERCarouselViewModel;

@interface PERCarouselView : UIView

+ (CGFloat)viewHeight;

- (void)setCardListData:(NSArray<PERCarouselViewModel *> *)cardList;
- (void)addTimer;
- (void)cancelTimer;

@end

@interface PERCarouselViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
