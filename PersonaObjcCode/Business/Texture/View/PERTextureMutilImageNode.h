//
//  PERTextureMutilImageNode.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PERTextureMutilImageNode : ASDisplayNode

- (void)updateData:(NSArray *)datasource;

@end

NS_ASSUME_NONNULL_END
