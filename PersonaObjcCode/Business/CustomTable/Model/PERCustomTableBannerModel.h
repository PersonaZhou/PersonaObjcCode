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

@property (nonatomic, copy) NSString *title;

@end


@interface PERCustomTableListItemModel : NSObject

@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *introduction;

@end

NS_ASSUME_NONNULL_END
