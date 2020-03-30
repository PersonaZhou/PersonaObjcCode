//
//  PERCarouselPageView.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCarouselPageView.h"

@implementation PERCarouselPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.pageControlArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setAllCount:(NSUInteger)count {
    if (count == 0) return;
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    [self.pageControlArray removeAllObjects];
    
    for (int i = 0; i < count; i++) {
        UIView *lineView = [UIView new];
        lineView.layer.cornerRadius = 3.f;
        [self addSubview:lineView];
        
        if (i == 0) {
            lineView.backgroundColor = UIColorFromRGB(0xff5f72);
        } else {
            lineView.backgroundColor = [UIColor grayColor];
        }
        
        CGFloat x = 15 * i;
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(x));
            make.width.equalTo(@6);
            make.top.bottom.equalTo(self);
            if (i == count - 1) {
                make.right.equalTo(self);
            }
            if (i == 0) {
                make.left.equalTo(self);
            }
        }];
        
        [self.pageControlArray addObject:lineView];
    }
}

- (void)setIndex:(NSUInteger)index {
    if (index > self.pageControlArray.count - 1) return;
    
    for (UIView *view in self.pageControlArray) {
        NSInteger viewIndex = [self.pageControlArray indexOfObject:view];
        if (viewIndex == index) {
            view.backgroundColor = UIColorFromRGB(0xff5f72);
        } else {
            view.backgroundColor = [UIColor grayColor];
        }
    }
}

@end
