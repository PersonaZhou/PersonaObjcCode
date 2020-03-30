//
//  PERTextureReplyCellNode.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureReplyCellNode.h"

@interface PERTextureReplyCellNode ()

@property (nonatomic, strong) ASNetworkImageNode *avatarImageNode;
@property (nonatomic, strong) ASTextNode *followerNameTextNode;
@property (nonatomic, strong) ASTextNode *replyTextNode;
@property (nonatomic, strong) ASTextNode *reviewerNameTextNode;
@property (nonatomic, strong) ASTextNode *commentTextNode;

@end

@implementation PERTextureReplyCellNode

- (instancetype)init {
    if (self = [super init]) {
        [self setupNode];
        self.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)bindModel:(PERTextureReplyModel *)model {
    self.avatarImageNode.URL = [NSURL URLWithString:model.avatar];
    self.followerNameTextNode.attributedText = model.followerNameAttribute;
    self.reviewerNameTextNode.attributedText = model.reviewerNameAttribute;
    self.commentTextNode.attributedText = model.commentAttribute;
    self.replyTextNode.hidden = !model.reviewerNameAttribute;
}

- (void)setupNode {
    [self addSubnode:self.avatarImageNode];
    [self addSubnode:self.followerNameTextNode];
    [self addSubnode:self.replyTextNode];
    [self addSubnode:self.reviewerNameTextNode];
    [self addSubnode:self.commentTextNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASDimension contentMaxWidth = ASDimensionMakeWithPoints(UIScreen.mainScreen.bounds.size.width - 85);
    self.commentTextNode.style.maxWidth = contentMaxWidth;
    
    ASStackLayoutSpec *replySpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    replySpec.spacing = 5;
    replySpec.alignItems = ASStackLayoutAlignItemsCenter;
    replySpec.justifyContent = ASStackLayoutJustifyContentStart;
    [replySpec setChildren:@[
        self.followerNameTextNode,
        self.replyTextNode,
        self.reviewerNameTextNode
    ]];
    
    ASStackLayoutSpec *commentSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    commentSpec.spacing = 5;
    commentSpec.justifyContent = ASStackLayoutJustifyContentStart;
    [commentSpec setChildren:@[
        replySpec,
        self.commentTextNode
    ]];
    
    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    contentSpec.spacing = 10;
    contentSpec.justifyContent = ASStackLayoutJustifyContentStart;
    [contentSpec setChildren:@[
        self.avatarImageNode,
        commentSpec
    ]];
    
    ASInsetLayoutSpec *spec = [ASInsetLayoutSpec
                               insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 5, 10, 5)
                               child:contentSpec];
    
    return spec;
}

- (ASNetworkImageNode *)avatarImageNode {
    if (_avatarImageNode) return _avatarImageNode;
    
    _avatarImageNode = [ASNetworkImageNode new];
    _avatarImageNode.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _avatarImageNode.shouldRenderProgressImages = YES;
    _avatarImageNode.layer.cornerRadius = 3.f;
    _avatarImageNode.layer.masksToBounds = YES;
    _avatarImageNode.style.preferredSize = CGSizeMake(30, 30);
    _avatarImageNode.defaultImage = [UIImage imageLoadingDefault];
    
    return _avatarImageNode;
}

- (ASTextNode *)followerNameTextNode {
    if (_followerNameTextNode) return _followerNameTextNode;
    
    _followerNameTextNode = [ASTextNode new];
    
    return _followerNameTextNode;
}

- (ASTextNode *)replyTextNode {
    if (_replyTextNode) return _replyTextNode;
    
    _replyTextNode = [ASTextNode new];
    NSDictionary *locationAttributesDic = @{
        NSFontAttributeName: [UIFont systemFontOfSize:14],
        NSForegroundColorAttributeName: UIColorFromRGB(0x000000)
    };
    _replyTextNode.attributedText = [[NSAttributedString alloc] initWithString:@"回复" attributes:locationAttributesDic];
    
    return _replyTextNode;
}

- (ASTextNode *)reviewerNameTextNode {
    if (_reviewerNameTextNode) return _reviewerNameTextNode;
    
    _reviewerNameTextNode = [ASTextNode new];
    
    return _reviewerNameTextNode;
}

- (ASTextNode *)commentTextNode {
    if (_commentTextNode) return _commentTextNode;
    
    _commentTextNode = [ASTextNode new];
    _commentTextNode.truncationMode = NSLineBreakByCharWrapping;
    _commentTextNode.maximumNumberOfLines = 5;
    
    return _commentTextNode;
}


@end
