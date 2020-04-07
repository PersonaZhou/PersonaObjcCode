//
//  PERRecordViewLayout.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/30.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PERRecordCollectionLayoutDelegate <NSObject>

@optional
// 用协议传回 item 的内容,用于计算 item 宽度
- (NSString *)collectionViewItemSizeWithIndexPath:(NSIndexPath *)indexPath;
// 用协议传回 headerSize 的 size
- (CGSize)collectionViewDynamicHeaderSizeWithIndexPath:(NSIndexPath *)indexPath;
// 用协议传回 footerSize 的 size
- (CGSize)collectionViewDynamicFooterSizeWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface PERRecordViewLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat lineSpacing; //行距
@property (nonatomic, assign) CGFloat space; //左右间距
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign) UIEdgeInsets itemInset;
@property (nonatomic, assign) UIEdgeInsets headerInset;
@property (nonatomic, assign) UIEdgeInsets footerInset;
@property (nonatomic, strong) UIFont *labelFont;

@property (nonatomic, weak) id<PERRecordCollectionLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
