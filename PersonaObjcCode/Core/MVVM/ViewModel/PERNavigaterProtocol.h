//
//  PERNavigaterProtocol.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PERViewModelProtocol;

@protocol PERNavigaterProtocol <NSObject>

- (void)pushViewModel:(nonnull id<PERViewModelProtocol>)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(nonnull id<PERViewModelProtocol>)viewModel animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

- (void)resetRootViewModel;

- (BOOL)openURL:(nullable NSString *)url;

@optional
- (BOOL)selectTabBarIndex:(NSUInteger)index;

@end
