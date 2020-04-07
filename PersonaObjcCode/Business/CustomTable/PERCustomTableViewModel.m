//
//  PERCustomTableViewModel.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCustomTableViewModel.h"
#import "PERCustomBannerCell.h"
#import "PERCustomListCell.h"
#import "PERNetwork+CustomTable.h"

@implementation PERCustomTableViewModel
@synthesize selectCommand = _selectCommand;
@synthesize documentUrl = _documentUrl;

- (nonnull RACSignal *)loadDataFromPage:(NSUInteger)page perPage:(NSUInteger)perPage {
    @weakify(self);
    RACSignal *bannerSignal = [[[[self.services.network fetchCustomTableBanner] collect] flattenMap:^__kindof RACSignal * _Nullable(NSArray *value) {
        if (!value || value.count == 0) {
            return [RACSignal empty];
        }
        return [RACSignal return:value];
    }] map:^id _Nullable(NSArray *value) {
        @strongify(self);
        PERCustomBannerCellViewModel *vm = [[PERCustomBannerCellViewModel alloc] initWithServices:self.services];
        vm.banners = value;
        return vm;
    }];
    
    RACSignal *listSignal = [[self.services.network fetchCustomTableListWithPage:page pageSize:perPage] map:^id _Nullable(PERCustomTableListItemModel *value) {
        @strongify(self);
        PERCustomListCellViewModel *vm = [[PERCustomListCellViewModel alloc] initWithServices:self.services];
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
        _selectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id viewModel) {
            return [RACSignal empty];
        }];
    }
    
    return _selectCommand;
}

- (NSString *)documentUrl {
    return nil;
}


@end
