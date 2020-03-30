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

@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
