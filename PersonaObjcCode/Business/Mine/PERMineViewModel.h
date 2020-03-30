//
//  PERMineViewModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERMineViewModel : PERViewModel

@property (nonatomic, strong, readonly) RACCommand *logoutCommand;

@end

NS_ASSUME_NONNULL_END
