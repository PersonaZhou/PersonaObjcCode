//
//  PERDemoModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PERDemoItemTypeYoga = 1,
    PERDemoItemTypeTexture,
    PERDemoItemTypeCustomTable
} PERDemoItemType;

@interface PERDemoModel : NSObject

@property (nonatomic, assign) PERDemoItemType type;
@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
