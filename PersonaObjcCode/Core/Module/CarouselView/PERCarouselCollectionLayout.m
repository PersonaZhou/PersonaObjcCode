//
//  PERCarouselCollectionLayout.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCarouselCollectionLayout.h"
#import "PERCarouselView.h"

static const float minScale = 0.8;
static const float spacing = 11;

@interface PERCarouselCollectionLayout ()

@property (nonatomic) CGSize cardSize;
@property (nonatomic) NSInteger itemsCount;
@property (nonatomic, assign) CGPoint contentOffset;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) CGSize collectionViewBounds;
@property (nonatomic, assign) CGSize collectionViewContentSize;
@property (nonatomic, assign) BOOL didInitial;

@end

@implementation PERCarouselCollectionLayout {
    
}

- (void)prepareLayout {
    [super prepareLayout];
    
    CGFloat width = self.collectionViewBounds.width - (visibleItemsCount - 1)*spacing;
    CGFloat height = self.collectionViewBounds.height;
    self.cardSize = CGSizeMake(width, height);
    
    if (self.didInitial) return;
    
    self.didInitial = YES;
    
    //当首页上拉滑动到轮播器在可见区时再添加定时器，也就是到可见时prepareLayout才执行（在JJCardSliderView布局约束不要立刻[self.collectionView layoutIfNeeded]，否则prepareLayout会立刻被调用）
    PERCarouselView *view = (PERCarouselView *)self.collectionView.superview;
    if (view) {
        [view addTimer];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger itemsCount = [self.collectionView numberOfItemsInSection:0];
    if (itemsCount <= 0) {
        return nil;
    }
    
    NSInteger minVisibleIndex = MAX(self.currentPage, 0);
    NSInteger contentOffset = (int)self.contentOffset.x;
    NSInteger collectionViewBounds = (int)self.collectionViewBounds.width;
    CGFloat offset = contentOffset % collectionViewBounds;
    CGFloat offsetProgress = offset / self.collectionViewBounds.width*1.0f;
    NSInteger maxVisibleIndex = MAX(MIN(itemsCount - 1, self.currentPage + visibleItemsCount), minVisibleIndex);
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSInteger i = minVisibleIndex; i <= maxVisibleIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
         UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForIndexPath:indexPath currentPage:self.currentPage offset:offset offsetProgress:offsetProgress];
        [arr addObject:attributes];
    }
    
    return arr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForIndexPath:(NSIndexPath *)indexPath currentPage:(NSInteger)currentPage offset:(CGFloat)offset offsetProgress:(CGFloat)offsetProgress {
    
    UICollectionViewLayoutAttributes *attributes = [[self layoutAttributesForItemAtIndexPath:indexPath] copy];
    NSInteger visibleIndex = MAX(indexPath.item - currentPage + 1, 0);
    attributes.size = self.cardSize;
    CGFloat topCardMidX = self.contentOffset.x + self.cardSize.width / 2;
    attributes.center = CGPointMake(topCardMidX + spacing * (visibleIndex - 1), self.collectionViewBounds.height/2);
    attributes.zIndex = 1000 - visibleIndex;
    CGFloat scale = [self parallaxProgressForVisibleIndex:visibleIndex offsetProgress:offsetProgress minScale:minScale];
    attributes.transform = CGAffineTransformMakeScale(scale, scale);
    
    switch (visibleIndex) {
        case 1: {
            if (self.contentOffset.x >= 0) {
                attributes.center = CGPointMake(attributes.center.x - offset, attributes.center.y);
            }else{
                float x = attributes.center.x + attributes.size.width * (1 - scale)/2 - spacing * offsetProgress;
                attributes.center = CGPointMake(x, attributes.center.y);
            }
            break;
        }
        case visibleItemsCount + 1: {
            float x = attributes.center.x + attributes.size.width * (1 - scale)/2 - spacing;
            attributes.center = CGPointMake(x, attributes.center.y);
            break;
        }
        default: {
            float x = attributes.center.x + attributes.size.width * (1 - scale)/2 - spacing * offsetProgress;
            attributes.center = CGPointMake(x, attributes.center.y);
            break;
        }
    }
    return attributes;
}

- (CGFloat)parallaxProgressForVisibleIndex:(NSInteger)visibleIndex offsetProgress:(CGFloat)offsetProgress minScale:(CGFloat)minScale {
    CGFloat step = (1.0 - minScale) / (visibleItemsCount - 1) * 1.0;
    return (1.0 - (visibleIndex - 1) * step + step * offsetProgress);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSInteger)itemsCount {
    return [self.collectionView numberOfItemsInSection:0];
}

- (CGSize)collectionViewBounds {
    return self.collectionView.bounds.size;
}

- (CGPoint)contentOffset {
    return self.collectionView.contentOffset;
}

- (NSInteger)currentPage {
    return MAX(floor(self.contentOffset.x / self.collectionViewBounds.width), 0);
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionViewBounds.width * self.itemsCount, self.collectionViewBounds.height);
}

@end
