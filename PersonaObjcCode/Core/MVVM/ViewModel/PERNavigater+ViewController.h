//
//  PERNavigater+ViewController.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERNavigater.h"
#import "PERViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PERNavigater (ViewController)

- (UIViewController *)viewControllerForViewModel:(id<PERViewModelProtocol>)viewModel;

- (UIViewController *)viewControllerForUrlPath:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
