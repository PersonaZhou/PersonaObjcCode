//
//  PERCustomTableBannerModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PERCustomTableBannerModel : NSObject

//TODO 这个model有点重复，这里待重构

@property (nonatomic, copy) NSString *title; // 这里记录搜索记录的title

@end


@interface PERCustomTableListItemModel : NSObject

@property (nonatomic, copy) NSString *thumbnail; // 小说封面
@property (nonatomic, copy) NSString *title; // 小说名称
@property (nonatomic, copy) NSString *introduction; // 小说简介

@end

NS_ASSUME_NONNULL_END
