//
//  PERTextureReplyCellNode.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PERTextureModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERTextureReplyCellNode : ASCellNode

- (void)bindModel:(PERTextureReplyModel *)model;

@end

NS_ASSUME_NONNULL_END
