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

@property (nonatomic, copy) NSString *postUserAvatar;
@property (nonatomic, copy) NSString *postUserNickname;
@property (nonatomic, copy) NSAttributedString *postUserNicknameAttribute;
@property (nonatomic, copy) NSString *report;
@property (nonatomic, copy) NSAttributedString *reportAttribute;
@property (nonatomic, copy) NSArray<NSString *> *reportImages;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSAttributedString *locationAttribute;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSAttributedString *dateAttribute;
@property (nonatomic, copy) NSArray<NSString *> *likeAvatars;
@property (nonatomic, copy) NSArray<PERTextureReplyModel *> *replys;

@end

@interface PERTextureReplyModel : NSObject

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *followerName;
@property (nonatomic, copy) NSAttributedString *followerNameAttribute;
@property (nonatomic, copy) NSString *reviewerName;
@property (nonatomic, copy) NSAttributedString *reviewerNameAttribute;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSAttributedString *commentAttribute;

@end

NS_ASSUME_NONNULL_END
