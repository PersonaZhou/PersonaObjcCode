//
//  PERHomeModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PERHomeListItem;

@interface PERHomeModel : NSObject

@end

@interface PERHomeListItem : NSObject

@property (nonatomic, copy) NSString *imgName; // 首页cell的图片
@property (nonatomic, copy) NSString *title; // 首页cell的标题
@property (nonatomic, copy) NSString *introduction; // 首页cell内容简介
@property (nonatomic, copy) NSString *url; // 首页cell的统跳URL，如果只有一个统跳
@property (nonatomic, copy) NSArray<PERUrlModel *> *urls; // 如果有多个统跳URL

@end

NS_ASSUME_NONNULL_END
