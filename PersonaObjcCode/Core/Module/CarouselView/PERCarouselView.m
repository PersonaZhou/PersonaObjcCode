//
//  PERCarouselView.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCarouselView.h"
#import "PERCarouselPageView.h"
#import "PERCarouselCollectionViewCell.h"
#import "PERCarouselCollectionLayout.h"
#import "WKWebView+Utility.h"

static const int groupCount = 101; //最好奇数（定位到中间）  如：3，5，11~51，101
static const float timerInterval = 3.0f;

@interface PERCarouselView ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) PERCarouselPageView *pageControlView;

@property (nonatomic, copy) NSArray<PERCarouselViewModel *> *dataSource;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) BOOL reload;

@end

@implementation PERCarouselView

+ (CGFloat)viewHeight {
    return (175 * [[UIScreen mainScreen] bounds].size.width / 375.0 + 50);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self makeConstraints];
    }
    return self;
}

- (void)setCardListData:(NSArray<PERCarouselViewModel *> *)cardList {
    if (cardList && cardList.count > 0) {
        self.dataSource = cardList;
        self.pageControlView.hidden = NO;
    }else{
        self.titleLabel.text = @"";
        self.pageControlView.hidden = YES;
        self.dataSource = [NSArray array];
    }
    
    [self.collectionView reloadData];
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.pageControlView setAllCount:self.dataSource.count];
    
    if (self.reload) {
        [self addTimer];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    if (newWindow) {
        [self startTimer];
    } else {
        [self cancelTimer];
    }
}

- (void)setupUI {
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControlView];
}

- (void)makeConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@5);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.bottom.equalTo(@-20);
    }];
    
    [self.pageControlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(7);
        make.centerX.equalTo(@0);
        make.height.equalTo(@6);
    }];
}

- (void)startTimer {
    if (self.timer) return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(cardInfiniteScrolling) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)cancelTimer {
    if (!self.timer) return;
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)addTimer {
    self.reload = YES;
    
    if (!self.dataSource || self.dataSource.count <= 0) return;
    
    [self cancelTimer];
    NSInteger centerIndex = (groupCount / 2) * self.dataSource.count;
    [self.collectionView setContentOffset:CGPointMake(centerIndex * self.collectionView.bounds.size.width, 0) animated:NO];
    
    self.selectedIndex = centerIndex;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(cardInfiniteScrolling) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)cardInfiniteScrolling {
    self.selectedIndex ++;
    
    [self.collectionView setContentOffset:CGPointMake(self.selectedIndex * self.collectionView.bounds.size.width, 0) animated:YES];
}

- (void)updateCardInfoByScrollView:(UIScrollView *)scrollView {
    self.selectedIndex = (scrollView.contentOffset.x + 20) / self.collectionView.bounds.size.width;
    if (self.selectedIndex >= (self.dataSource.count * groupCount - 1 - visibleItemsCount) || self.selectedIndex == 0) {
        NSInteger centerIndex = (groupCount / 2) * self.dataSource.count;
        [self.collectionView setContentOffset:CGPointMake(centerIndex * self.collectionView.bounds.size.width, 0)
                                     animated:NO];
        self.selectedIndex = centerIndex;
    }
    
    if (self.dataSource && self.dataSource.count > 0 && self.selectedIndex % self.dataSource.count < self.pageControlView.pageControlArray.count) {
        [self.pageControlView setIndex:self.selectedIndex % self.dataSource.count];
    }
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count * groupCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PERCarouselCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PERCarouselCollectionViewCell class]) forIndexPath:indexPath];
    if (indexPath.row < self.dataSource.count * groupCount) {
        PERCarouselViewModel *vm = self.dataSource[indexPath.row % self.dataSource.count];
        [cell setCellImageName:vm.imgName];
        self.titleLabel.text = vm.title;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.dataSource.count * groupCount) {
        return;
    }
    NSInteger index = indexPath.row % self.dataSource.count;
    if (index < self.dataSource.count) {
        PERCarouselViewModel *model = self.dataSource[index];
        [WKWebView openUrl:model.url];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self cancelTimer];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateCardInfoByScrollView:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self updateCardInfoByScrollView:scrollView];
}

#pragma mark - lazy load

- (UICollectionView *)collectionView {
    if (_collectionView) return _collectionView;
    
    PERCarouselCollectionLayout *flowLayout = [[PERCarouselCollectionLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                         collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.clipsToBounds = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    [_collectionView registerClass:[PERCarouselCollectionViewCell class]
        forCellWithReuseIdentifier:NSStringFromClass(PERCarouselCollectionViewCell.class)];
    
    return _collectionView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    _titleLabel.textColor = [UIColor blackColor];
    
    return _titleLabel;
}

- (PERCarouselPageView *)pageControlView {
    if (_pageControlView) return _pageControlView;
    
    _pageControlView = [[PERCarouselPageView alloc] init];
    
    return _pageControlView;
}

- (void)dealloc {
    [self cancelTimer];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation PERCarouselViewModel

@end
