//
//  PERRecordView.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/30.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERRecordView.h"
#import "PERRecordViewCell.h"
#import "PERRecordViewLayout.h"

@interface PERRecordView ()<UICollectionViewDelegate, UICollectionViewDataSource, PERRecordCollectionLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation PERRecordView

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
        [self makeConstraints];
        [self.collectionView reloadData];
    }
    
    return self;
}

- (void)updateData:(NSArray<PERRecordModel *> *)data {
    self.dataArray = data;
    [self.collectionView reloadData];
}

- (void)setupUI {
    [self addSubview:self.collectionView];
}

- (void)makeConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.left.equalTo(@8);
        make.right.equalTo(@8);
    }];
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PERRecordViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PERRecordViewCell" forIndexPath:indexPath];
    PERRecordModel *model = self.dataArray[indexPath.row];
    [cell bindModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
}

#pragma mark - lazy

- (UICollectionView *)collectionView {
    if ( !_collectionView ) {
        
        PERRecordViewLayout *layout = [[PERRecordViewLayout alloc] init];
        layout.lineSpacing = 5;
        layout.space = 5;
        layout.itemInset = UIEdgeInsetsMake(2, 3, 2, 3);
        layout.itemHeight = 18;
        layout.labelFont = [UIFont boldSystemFontOfSize:14];
        layout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:PERRecordViewCell.class forCellWithReuseIdentifier:NSStringFromClass(PERRecordViewCell.class)];
    }
    
    return _collectionView;
}

- (NSString *)collectionViewItemSizeWithIndexPath:(NSIndexPath *)indexPath {
    PERRecordModel *model = self.dataArray[indexPath.row];
    return model.title;
}

@end
