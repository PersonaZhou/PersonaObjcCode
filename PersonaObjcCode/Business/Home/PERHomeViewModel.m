//
//  PERHomeViewModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/30.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERHomeViewModel.h"
#import "PERNetwork+Home.h"
#import "PERHomeViewBannerCell.h"
#import "PERHomeViewListCell.h"

@implementation PERHomeViewModel
@synthesize selectCommand = _selectCommand;

- (nonnull RACSignal *)loadDataFromPage:(NSUInteger)page perPage:(NSUInteger)perPage {
    @weakify(self);
    RACSignal *bannerSignal = [[[[self.services.network fetchHomeBanner] collect] flattenMap:^__kindof RACSignal * _Nullable(NSArray *value) {
        if (!value || value.count == 0) {
            return [RACSignal empty];
        }
        return [RACSignal return:value];
    }] map:^id _Nullable(NSArray *value) {
        @strongify(self);
        PERHomeViewBannerCellViewModel *vm = [[PERHomeViewBannerCellViewModel alloc] initWithServices:self.services];
        vm.banners = value;
        return vm;
    }];
    
    RACSignal *listSignal = [[self.services.network fetchHomeListWithPage:page pageSize:perPage] map:^id _Nullable(PERHomeListItem *value) {
        @strongify(self);
        PERHomeViewListCellViewModel *vm = [[PERHomeViewListCellViewModel alloc] initWithServices:self.services];
        vm.item = value;
        return vm;
    }];
    
    if (page == 0) {
        return [[RACSignal concat:@[bannerSignal, listSignal]] collect];
    }else {
        return [listSignal collect];
    }
}

- (RACCommand *)selectCommand {
    if (!_selectCommand) {
        @weakify(self);
        _selectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id viewModel) {
            @strongify(self);
            if ([viewModel isKindOfClass:PERHomeViewListCellViewModel.class]) {
                PERHomeViewListCellViewModel *vm = (PERHomeViewListCellViewModel *)viewModel;
                if (vm.item.url && vm.item.url.length > 0) {
                    [self.services.navigater openURL:vm.item.url];
                }else if (vm.item.urls && vm.item.urls.count > 0) {
                    [UIAlertController showActionSheetWithTitle:nil message:nil url:vm.item.urls];
                }
            }
            
            return [RACSignal empty];
        }];
    }
    
    return _selectCommand;
}

@end
