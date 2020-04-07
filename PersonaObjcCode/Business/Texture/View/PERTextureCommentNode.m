//
//  PERTextureCommentNode.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/27.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERTextureCommentNode.h"
#import "PERTextureReplyCellNode.h"

@interface PERTextureCommentNode ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASImageNode *bgImageNode;
@property (nonatomic, strong) ASControlNode *likeNode;
@property (nonatomic, strong) ASImageNode *likeImageNode;
/* 这里偷懒没有用collection view来实现，所以最多只能显示5个点赞用户头像 */
@property (nonatomic, strong) ASNetworkImageNode *likeUserAvatarImageNode1;
@property (nonatomic, strong) ASNetworkImageNode *likeUserAvatarImageNode2;
@property (nonatomic, strong) ASNetworkImageNode *likeUserAvatarImageNode3;
@property (nonatomic, strong) ASNetworkImageNode *likeUserAvatarImageNode4;
@property (nonatomic, strong) ASNetworkImageNode *likeUserAvatarImageNode5;
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, copy) NSArray<ASNetworkImageNode *> *likeUserAvatars;
@property (nonatomic, copy) NSArray<PERTextureReplyModel *> *replys;

@end

@implementation PERTextureCommentNode

- (instancetype)init {
    if (self = [super init]) {
        self.likeUserAvatars = @[self.likeUserAvatarImageNode1,
                                 self.likeUserAvatarImageNode2,
                                 self.likeUserAvatarImageNode3,
                                 self.likeUserAvatarImageNode4,
                                 self.likeUserAvatarImageNode5];
        [self setupNode];
    }
    
    return self;
}

- (void)updataWithLikeAvatars:(NSArray<NSString *> *)likeAvatars reply:(NSArray<PERTextureReplyModel *> *)replys {
    if (likeAvatars.count > 0) {
        for (int i = 0; i < likeAvatars.count; i++) {
            NSString *avatar = likeAvatars[i];
            ASNetworkImageNode *node = self.likeUserAvatars[i];
            node.URL = [NSURL URLWithString:avatar];
            if (i >= 4) {
                break;
            }
        }
    }
    
    if (replys.count > 0) {
        self.replys = replys; // 由于Texture是响应式框架，这里不用再调用reload，会自动触发刷新
    }
}

- (void)setupNode {
    [self addSubnode:self.bgImageNode];
    [self addSubnode:self.likeNode];
    [self addSubnode:self.likeImageNode];
    [self addSubnode:self.likeUserAvatarImageNode1];
    [self addSubnode:self.likeUserAvatarImageNode2];
    [self addSubnode:self.likeUserAvatarImageNode3];
    [self addSubnode:self.likeUserAvatarImageNode4];
    [self addSubnode:self.likeUserAvatarImageNode5];
    [self addSubnode:self.tableNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.tableNode.style.preferredSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width - 40, 450);
    
    ASStackLayoutSpec *likeSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    likeSpec.spacing = 5;
    likeSpec.alignItems = ASStackLayoutAlignItemsCenter;
    likeSpec.justifyContent = ASStackLayoutJustifyContentStart;
    [likeSpec setChildren:@[
        self.likeImageNode,
        self.likeUserAvatarImageNode1,
        self.likeUserAvatarImageNode2,
        self.likeUserAvatarImageNode3,
        self.likeUserAvatarImageNode4,
        self.likeUserAvatarImageNode5
    ]];
    
    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    contentSpec.spacing = 10;
    [contentSpec setChildren:@[likeSpec, self.tableNode]];
    
    ASInsetLayoutSpec *insetLayout = [ASInsetLayoutSpec
                                      insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 5, 5, 0)
                                      child:contentSpec];
    
    ASBackgroundLayoutSpec *spec = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:insetLayout
                                                                              background:self.bgImageNode];
    
    return spec;
}

#pragma mark - tableNode delegate

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    return 1;
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.replys.count;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    PERTextureReplyCellNode *node = [[PERTextureReplyCellNode alloc] init];
    PERTextureReplyModel *reply = self.replys[indexPath.row];
    [node bindModel:reply];
    return node;
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO 回复消息
}

- (ASImageNode *)bgImageNode {
    if (_bgImageNode) return _bgImageNode;
    
    _bgImageNode = [[ASImageNode alloc] init];
    _bgImageNode.image = [[UIImage imageNamed:@"texture_message_box_icon"] stretchableImageWithLeftCapWidth:30 topCapHeight:10];
    
    return _bgImageNode;
}

- (ASTableNode *)tableNode {
    if (_tableNode) return _tableNode;
    
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.scrollEnabled = NO;
    _tableNode.view.showsVerticalScrollIndicator = NO;
    _tableNode.backgroundColor = UIColor.clearColor;
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return _tableNode;
}

- (ASControlNode *)likeNode {
    if (_likeNode) return _likeNode;
    
    _likeNode = [ASControlNode new];
    
    return _likeNode;
}

- (ASImageNode *)likeImageNode {
    if (_likeImageNode) return _likeImageNode;
    
    _likeImageNode = [[ASImageNode alloc] init];
    _likeImageNode.image = [UIImage imageNamed:@"texture_lick_icon"];
    _likeImageNode.contentMode = UIViewContentModeScaleAspectFill;
    
    return _likeImageNode;
}

- (ASNetworkImageNode *)likeUserAvatarImageNode1 {
    if (_likeUserAvatarImageNode1) return _likeUserAvatarImageNode1;
    
    _likeUserAvatarImageNode1 = [ASNetworkImageNode new];
    _likeUserAvatarImageNode1.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _likeUserAvatarImageNode1.shouldRenderProgressImages = YES;
    _likeUserAvatarImageNode1.layer.cornerRadius = 3.f;
    _likeUserAvatarImageNode1.layer.masksToBounds = YES;
    _likeUserAvatarImageNode1.style.preferredSize = CGSizeMake(30, 30);
    _likeUserAvatarImageNode1.defaultImage = [UIImage imageLoadingDefault];
    
    return _likeUserAvatarImageNode1;
}

- (ASNetworkImageNode *)likeUserAvatarImageNode2 {
    if (_likeUserAvatarImageNode2) return _likeUserAvatarImageNode2;
    
    _likeUserAvatarImageNode2 = [ASNetworkImageNode new];
    _likeUserAvatarImageNode2.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _likeUserAvatarImageNode2.shouldRenderProgressImages = YES;
    _likeUserAvatarImageNode2.layer.cornerRadius = 3.f;
    _likeUserAvatarImageNode2.layer.masksToBounds = YES;
    _likeUserAvatarImageNode2.style.preferredSize = CGSizeMake(30, 30);
    _likeUserAvatarImageNode2.defaultImage = [UIImage imageLoadingDefault];
    
    return _likeUserAvatarImageNode2;
}

- (ASNetworkImageNode *)likeUserAvatarImageNode3 {
    if (_likeUserAvatarImageNode3) return _likeUserAvatarImageNode3;
    
    _likeUserAvatarImageNode3 = [ASNetworkImageNode new];
    _likeUserAvatarImageNode3.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _likeUserAvatarImageNode3.shouldRenderProgressImages = YES;
    _likeUserAvatarImageNode3.layer.cornerRadius = 3.f;
    _likeUserAvatarImageNode3.layer.masksToBounds = YES;
    _likeUserAvatarImageNode3.style.preferredSize = CGSizeMake(30, 30);
    _likeUserAvatarImageNode3.defaultImage = [UIImage imageLoadingDefault];
    
    return _likeUserAvatarImageNode3;
}

- (ASNetworkImageNode *)likeUserAvatarImageNode4 {
    if (_likeUserAvatarImageNode4) return _likeUserAvatarImageNode4;
    
    _likeUserAvatarImageNode4 = [ASNetworkImageNode new];
    _likeUserAvatarImageNode4.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _likeUserAvatarImageNode4.shouldRenderProgressImages = YES;
    _likeUserAvatarImageNode4.layer.cornerRadius = 3.f;
    _likeUserAvatarImageNode4.layer.masksToBounds = YES;
    _likeUserAvatarImageNode4.style.preferredSize = CGSizeMake(30, 30);
    _likeUserAvatarImageNode4.defaultImage = [UIImage imageLoadingDefault];
    
    return _likeUserAvatarImageNode4;
}

- (ASNetworkImageNode *)likeUserAvatarImageNode5 {
    if (_likeUserAvatarImageNode5) return _likeUserAvatarImageNode5;
    
    _likeUserAvatarImageNode5 = [ASNetworkImageNode new];
    _likeUserAvatarImageNode5.placeholderColor = ASDisplayNodeDefaultPlaceholderColor();
    _likeUserAvatarImageNode5.shouldRenderProgressImages = YES;
    _likeUserAvatarImageNode5.layer.cornerRadius = 3.f;
    _likeUserAvatarImageNode5.layer.masksToBounds = YES;
    _likeUserAvatarImageNode5.style.preferredSize = CGSizeMake(30, 30);
    _likeUserAvatarImageNode5.defaultImage = [UIImage imageLoadingDefault];
    
    return _likeUserAvatarImageNode5;
}

@end
