//
//  PERTextureCellNode.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/26.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureCellNode.h"
#import "PERTextureMutilImageNode.h"
#import "PERTextureCommentNode.h"

@interface PERTextureCellNode ()

@property (nonatomic, strong) ASNetworkImageNode *avatarImageNode;
@property (nonatomic, strong) ASTextNode *nicknameNode;
@property (nonatomic, strong) ASTextNode *reportNode;
@property (nonatomic, strong) PERTextureMutilImageNode *mutilImageNode;
@property (nonatomic, strong) ASTextNode *locationNode;
@property (nonatomic, strong) ASTextNode *dateNode;
@property (nonatomic, strong) ASButtonNode *delBtnNode;
@property (nonatomic, strong) ASImageNode *replyImageNode;
@property (nonatomic, strong) PERTextureCommentNode *commentNode;

@end

@implementation PERTextureCellNode

- (instancetype)init {
    if (self = [super init]) {
        [self setupNode];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)bindModel:(PERTextureModel *)model {
    self.avatarImageNode.URL = [NSURL URLWithString:model.postUserAvatar];
    self.nicknameNode.attributedText = model.postUserNicknameAttribute;
    self.reportNode.attributedText = model.reportAttribute;
    self.locationNode.attributedText = model.locationAttribute;
    self.dateNode.attributedText = model.dateAttribute;
    
    [self.mutilImageNode updateData:model.reportImages];
    [self.commentNode updataWithLikeAvatars:model.likeAvatars reply:model.replys];
}

- (void)setupNode {
    [self addSubnode:self.avatarImageNode];
    [self addSubnode:self.nicknameNode];
    [self addSubnode:self.reportNode];
    [self addSubnode:self.mutilImageNode];
    [self addSubnode:self.locationNode];
    [self addSubnode:self.dateNode];
    [self addSubnode:self.delBtnNode];
    [self addSubnode:self.replyImageNode];
    [self addSubnode:self.commentNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.avatarImageNode.style.preferredSize = CGSizeMake(50, 50);
    ASDimension contentMaxWidth = ASDimensionMakeWithPoints(constrainedSize.max.width - 82);
    self.nicknameNode.style.maxWidth = contentMaxWidth;
    self.reportNode.style.maxWidth = contentMaxWidth;
    
    ASStackLayoutSpec *dateDelSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    dateDelSpec.spacing = 5;
    dateDelSpec.alignItems = ASStackLayoutAlignItemsCenter;
    dateDelSpec.justifyContent = ASStackLayoutJustifyContentStart;
    [dateDelSpec setChildren:@[self.dateNode, self.delBtnNode]];
    
    ASStackLayoutSpec *dateDelReplySpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    dateDelReplySpec.spacing = 5;
    dateDelReplySpec.alignItems = ASStackLayoutAlignItemsCenter;
    dateDelReplySpec.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
    [dateDelReplySpec setChildren:@[dateDelSpec, self.replyImageNode]];
    
    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    contentSpec.spacing = 10;
    contentSpec.alignItems = ASStackLayoutAlignItemsStretch;
    contentSpec.style.maxWidth = contentMaxWidth;
    [contentSpec setChildren:@[self.nicknameNode,
                               self.reportNode,
                               self.mutilImageNode,
                               self.locationNode, dateDelReplySpec]];
    
    ASStackLayoutSpec *avatarContentSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    avatarContentSpec.spacing = 10;
    [avatarContentSpec setChildren:@[self.avatarImageNode, contentSpec]];
    
    ASStackLayoutSpec *commentSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    commentSpec.spacing = 10;
    [commentSpec setChildren:@[avatarContentSpec, self.commentNode]];
    
    ASInsetLayoutSpec *spec = [ASInsetLayoutSpec
                                       insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 15, 10, 15)
                                       child:commentSpec];
    
    return spec;
}

- (void)deleteRecord:(id)sender {
    NSLog(@"delete record");
}

- (ASNetworkImageNode *)avatarImageNode {
    if (_avatarImageNode) return _avatarImageNode;
    
    _avatarImageNode = [ASNetworkImageNode new];
    _avatarImageNode.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _avatarImageNode.shouldRenderProgressImages = YES;
    _avatarImageNode.layer.cornerRadius = 3.f;
    _avatarImageNode.layer.masksToBounds = YES;
    _avatarImageNode.defaultImage = [UIImage imageLoadingDefault];
    
    return _avatarImageNode;
}

- (ASTextNode *)nicknameNode {
    if (_nicknameNode) return _nicknameNode;
    
    _nicknameNode = [ASTextNode new];
    
    return _nicknameNode;
}

- (ASTextNode *)reportNode {
    if (_reportNode) return _reportNode;
    
    _reportNode = [ASTextNode new];
    _reportNode.truncationMode = NSLineBreakByTruncatingTail;
    _reportNode.maximumNumberOfLines = 10;
    
    return _reportNode;
}

- (PERTextureMutilImageNode *)mutilImageNode {
    if (_mutilImageNode) return _mutilImageNode;
    
    _mutilImageNode = [PERTextureMutilImageNode new];
    
    return _mutilImageNode;
}

- (ASTextNode *)locationNode {
    if (_locationNode) return _locationNode;
    
    _locationNode = [ASTextNode new];
    
    return _locationNode;
}

- (ASTextNode *)dateNode {
    if (_dateNode) return _dateNode;
    
    _dateNode = [ASTextNode new];
    
    return _dateNode;
}

- (ASButtonNode *)delBtnNode {
    if (_delBtnNode) return _delBtnNode;
    
    _delBtnNode = [ASButtonNode new];
    
    NSDictionary *dateAttributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:13],
        NSForegroundColorAttributeName: UIColorFromRGB(0x1684fd)
    };
    
    NSAttributedString *attributesDic = [[NSAttributedString alloc]
                                         initWithString:@"删除"
                                         attributes:dateAttributes];
    
    [_delBtnNode setAttributedTitle:attributesDic forState:UIControlStateNormal];
    [_delBtnNode addTarget:self action:@selector(deleteRecord:) forControlEvents:ASControlNodeEventTouchUpInside];
    
    return _delBtnNode;
}

- (ASImageNode *)replyImageNode {
    if (_replyImageNode) return _replyImageNode;
    
    _replyImageNode = [[ASImageNode alloc] init];
    _replyImageNode.image = [UIImage imageNamed:@"texture_reply_icon"];
    _replyImageNode.contentMode = UIViewContentModeScaleAspectFill;
    
    return _replyImageNode;
}

- (PERTextureCommentNode *)commentNode {
    if (_commentNode) return _commentNode;
    
    _commentNode = [PERTextureCommentNode new];
    
    return _commentNode;
}


@end
