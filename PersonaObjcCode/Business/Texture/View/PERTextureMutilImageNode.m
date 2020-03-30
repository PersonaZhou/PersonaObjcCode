//
//  PERTextureMutilImageNode.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureMutilImageNode.h"
#import "PERTextureMutilImageCellNode.h"

@interface PERTextureMutilImageNode ()<ASCollectionDelegate, ASCollectionDataSource>

@property (nonatomic, strong) ASCollectionNode *collectionNode;
@property (nonatomic, copy) NSArray *datasource;

@end

@implementation PERTextureMutilImageNode

- (instancetype)init {
    if (self = [super init]) {
        [self setupNode];
    }
    
    return self;
}

- (void)updateData:(NSArray *)datasource {
    if (!datasource || datasource.count == 0) return;
    
    self.datasource = datasource; //由于Texture是响应式框架，这里不用再调用reload，会自动触发刷新
}

- (void)setupNode {
    [self addSubnode:self.collectionNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    if (self.datasource.count == 1) {
        
    } else if (self.datasource.count > 1) {
        
    }
    
    self.collectionNode.style.preferredSize = CGSizeMake(220, 220);
    
    ASStackLayoutSpec *layout = [ASStackLayoutSpec horizontalStackLayoutSpec];
    layout.horizontalAlignment = ASHorizontalAlignmentLeft;
    [layout setChildren:@[self.collectionNode]];
    
    return layout;
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
    return 1;
}

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForItemAtIndexPath:(NSIndexPath *)indexPath {
    PERTextureMutilImageCellNode *cellNode = [[PERTextureMutilImageCellNode alloc] init];
    NSString *avatar = self.datasource[indexPath.row];
    [cellNode updateAvatar:avatar];
    return cellNode;
}

- (void)collectionNode:(ASCollectionNode *)collectionNode didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"click no.%ld image", indexPath.row);
    // TODO 全屏浏览图片
}

//- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    return nil;
//}
//
//- (ASSizeRange)collectionNode:(ASCollectionNode *)collectionNode constrainedSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return ASSizeRangeMake(CGSizeMake(60, 60));
//}

- (ASCollectionNode *)collectionNode {
    if (_collectionNode) return _collectionNode;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.estimatedItemSize = CGSizeMake(70, 70);
    
    _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
    _collectionNode.delegate = self;
    _collectionNode.dataSource = self;
    _collectionNode.view.backgroundColor = [UIColor whiteColor];
    _collectionNode.view.scrollEnabled = NO;
    
    return _collectionNode;
}

@end
