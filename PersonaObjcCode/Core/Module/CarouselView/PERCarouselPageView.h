//
//  PERCarouselPageView.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PERCarouselPageView : UIView

@property(nonatomic, strong) NSMutableArray *pageControlArray;

- (void)setAllCount:(NSUInteger)count;
- (void)setIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
