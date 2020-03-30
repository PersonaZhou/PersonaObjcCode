//
//  PERTextureCommentNode.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PERTextureModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERTextureCommentNode : ASDisplayNode

- (void)updataWithLikeAvatars:(NSArray<NSString *> *)likeAvatars reply:(NSArray<PERTextureReplyModel *> *)replys;

@end

NS_ASSUME_NONNULL_END
