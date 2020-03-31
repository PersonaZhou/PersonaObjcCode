//
//  PERNavigater+ViewController.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERNavigater+ViewController.h"
#import "PERBussinessHeader.h"

#import <objc/runtime.h>

@interface PERNavigater ()

@property (nonatomic, strong) NSDictionary<__kindof NSString *, __kindof Class> *viewControllersClassByViewModel;
@property (nonatomic, strong) NSDictionary<__kindof NSString *, __kindof Class> *viewModelsClassByUrl;

@property (nonatomic, weak) PERServices *services;

@end

@implementation PERNavigater (ViewController)

- (UIViewController *)viewControllerForViewModel:(id<PERViewModelProtocol>)viewModel {
    UIViewController *vc = [[[self viewControllerClassByViewModelClass:viewModel.class] alloc] initWithViewModel:viewModel];
    assert(vc);
    return vc;
}

- (UIViewController *)viewControllerForUrlPath:(NSString *)url {
    if (!url || url.length == 0) return nil;
    if (![self.viewModelsClassByUrl.allKeys containsObject:url]) return nil;
    
    PERViewModel *viewModel = [[[self.viewModelsClassByUrl objectForKey:url] alloc] initWithServices:self.services];
    
    if (!viewModel) return nil;
    
    return [self viewControllerForViewModel:viewModel];
}

- (Class _Nullable)viewControllerClassByViewModelClass:(Class)viewModelClass {
    return [self.viewControllersClassByViewModel objectForKey:NSStringFromClass(viewModelClass.class)];
}

- (NSDictionary<__kindof NSString *, __kindof Class> *)viewControllersClassByViewModel {
    NSDictionary *vcs = objc_getAssociatedObject(self, _cmd);
    if (!vcs) {
        vcs = @{
            NSStringFromClass(PERHomeViewModel.class): PERHomeViewController.class,
            NSStringFromClass(PERMineViewModel.class): PERMineViewController.class,
            NSStringFromClass(PERLoginViewModel.class): PERLoginViewController.class,
            NSStringFromClass(PERYogaViewModel.class): PERYogaViewController.class,
            NSStringFromClass(PERTextureViewModel.class): PERTextureViewController.class,
            NSStringFromClass(PERCustomTableViewModel.class): PERCustomTableViewController.class,
        };
        
        objc_setAssociatedObject(self, _cmd, vcs, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return vcs;
}

static NSString *PERViewControllersKey = @"PERViewControllersKey";
- (void)setViewControllersClassByViewModel:(NSDictionary<__kindof NSString *, __kindof Class> *)viewControllersClassByViewModel {
    objc_setAssociatedObject(self, &PERViewControllersKey, viewControllersClassByViewModel, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary<__kindof NSString *, __kindof Class> *)viewModelsClassByUrl {
    NSDictionary *ms = objc_getAssociatedObject(self, _cmd);
    if (!ms) {
        ms = @{
            @"/yoga": PERYogaViewModel.class,
            @"/texture": PERTextureViewModel.class,
            @"/custom_table": PERCustomTableViewModel.class,
        };
        
        objc_setAssociatedObject(self, _cmd, ms, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return ms;
}

static NSString *PERViewModelsKey = @"PERViewModelsKey";
- (void)setViewModelsClassByUrl:(NSDictionary<__kindof NSString *, __kindof Class> *)viewModelsClassByUrl {
    objc_setAssociatedObject(self, &PERViewModelsKey, viewModelsClassByUrl, OBJC_ASSOCIATION_COPY);
}

@end
