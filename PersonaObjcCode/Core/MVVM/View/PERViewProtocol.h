//
//  PERViewProtocol.h
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PERViewModel.h"

@protocol PERViewProtocol <NSObject>

@optional

- (void)bindViewModel:(id<PERViewModelProtocol>)viewModel;
- (instancetype)initWithViewModel:(id<PERViewModelProtocol>)viewModel;

@end

@protocol PERTableViewCellProtocol<PERViewProtocol>

@property (nonatomic, strong) NSIndexPath *indexPath;

@optional
@property (nonatomic, assign) NSUInteger total;

@end
