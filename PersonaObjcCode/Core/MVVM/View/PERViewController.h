//
//  PERViewController.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PERViewProtocol.h"
#import "PERViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERViewController : UIViewController<PERViewProtocol>

@property (nonatomic, strong, readonly) id<PERViewModelProtocol> viewModel;

- (void)setupUI;

- (void)makeConstraints;

- (void)bindEvent;

- (void)buildNavigaterRightBtnItem;

@end

NS_ASSUME_NONNULL_END
