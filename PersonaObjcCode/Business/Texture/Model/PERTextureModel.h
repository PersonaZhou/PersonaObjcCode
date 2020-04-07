//
//  PERTextureModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PERTextureReplyModel;

@interface PERTextureModel : NSObject

@property (nonatomic, copy) NSString *postUserAvatar; // 发帖人头像
@property (nonatomic, copy) NSString *postUserNickname; // 发帖人昵称
@property (nonatomic, copy) NSAttributedString *postUserNicknameAttribute;
@property (nonatomic, copy) NSString *report; // 发表的文字内容
@property (nonatomic, copy) NSAttributedString *reportAttribute;
@property (nonatomic, copy) NSArray<NSString *> *reportImages; // 发表的图片
@property (nonatomic, copy) NSString *location; // 发送时的所在位置
@property (nonatomic, copy) NSAttributedString *locationAttribute;
@property (nonatomic, copy) NSString *date; // 发送时的时间
@property (nonatomic, copy) NSAttributedString *dateAttribute;
@property (nonatomic, copy) NSArray<NSString *> *likeAvatars; // 点赞者头像
@property (nonatomic, copy) NSArray<PERTextureReplyModel *> *replys; // 回复model，A回复B为一个model

@end

@interface PERTextureReplyModel : NSObject

@property (nonatomic, copy) NSString *avatar; // 回复者头像
@property (nonatomic, copy) NSString *followerName; // 回复者昵称
@property (nonatomic, copy) NSAttributedString *followerNameAttribute;
@property (nonatomic, copy) NSString *reviewerName; // 被回复者昵称
@property (nonatomic, copy) NSAttributedString *reviewerNameAttribute;
@property (nonatomic, copy) NSString *comment; // 回复的文字内容
@property (nonatomic, copy) NSAttributedString *commentAttribute;

@end

NS_ASSUME_NONNULL_END
