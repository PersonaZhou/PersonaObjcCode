//
//  PERViewModel.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERServices.h"

NS_ASSUME_NONNULL_BEGIN

@class PERViewModel;

@protocol PERViewModelProtocol <NSObject>

+ (instancetype)viewModelWithServices:(PERServices *)services;
- (instancetype)initWithServices:(PERServices *)services;

@optional

- (BOOL)configureWithURL:(NSURL *)url;
- (id)viewModelForDisplay;
- (void)viewModelWillAppear;

@end



@interface PERViewModel: NSObject<PERViewModelProtocol>

@property (nonatomic, strong) PERServices *services;

@end

NS_ASSUME_NONNULL_END
