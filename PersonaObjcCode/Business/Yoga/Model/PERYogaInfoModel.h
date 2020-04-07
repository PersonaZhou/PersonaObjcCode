//
//  PERYogaInfoModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PERYogaInfoModel : NSObject

@property (nonatomic, copy) NSString *avatar; // 头像
@property (nonatomic, copy) NSString *nickname; // 昵称
@property (nonatomic, copy) NSString *address; // 地址
@property (nonatomic, copy) NSString *email; // 邮箱

@end

NS_ASSUME_NONNULL_END
