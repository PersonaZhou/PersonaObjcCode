//
//  PERYogaViewModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERYogaViewModel : PERViewModel

@property (nonatomic, copy) NSString *documentUrl; // 文档URL

@property (nonatomic, copy, readonly) NSArray *dataSource; // tableView的dataSource

@end

NS_ASSUME_NONNULL_END
