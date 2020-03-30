//
//  PERDemoViewModel.h
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"
#import "PERDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERDemoViewModel : PERViewModel

@property (nonatomic, copy, readonly) NSArray<PERDemoModel *> *listArray;

@property (nonatomic, strong, readonly) RACCommand *selectCommand;

@end

NS_ASSUME_NONNULL_END
