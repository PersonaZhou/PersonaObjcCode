//
//  PERTextureMutilImageCellNode.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureMutilImageCellNode.h"

@interface PERTextureMutilImageCellNode ()

@property (nonatomic, strong) ASNetworkImageNode *imageNode;

@end

@implementation PERTextureMutilImageCellNode

- (instancetype)init {
    if (self = [super init]) {
        [self setupNode];
    }
    
    return self;
}

- (void)updateAvatar:(NSString *)avatar {
    if (!avatar || avatar.length == 0) return;
        
    self.imageNode.URL = [NSURL URLWithString:avatar];
}

- (void)setupNode {
    [self addSubnode:self.imageNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.imageNode.style.preferredSize = CGSizeMake(70, 70);
    
    ASInsetLayoutSpec *layout = [ASInsetLayoutSpec
                                 insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)
                                 child:self.imageNode];
    
    return layout;
}

- (ASNetworkImageNode *)imageNode {
    if (_imageNode) return _imageNode;
    
    _imageNode = [ASNetworkImageNode new];
    _imageNode.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _imageNode.shouldRenderProgressImages = YES;
    _imageNode.defaultImage = [UIImage imageLoadingDefault];
    
    return _imageNode;
}

@end
