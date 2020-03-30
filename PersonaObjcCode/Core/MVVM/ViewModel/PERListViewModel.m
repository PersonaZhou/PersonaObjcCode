//
//  PERListViewModel.m
//  PersonaObjcCode
//
//  Created by Persona on 2019/12/28.
//  Copyright © 2019 ZhouShisong. All rights reserved.
//

#import "PERListViewModel.h"

@interface PERListViewModel ()

@property (nonatomic, assign) BOOL hasMoreData;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;

@end

@implementation PERListViewModel
@synthesize models = _models;
@synthesize sourceSignal = _sourceSignal;
@synthesize loadCommand = _loadCommand;
@synthesize loadMoreCommand = _loadMoreCommand;

- (RACSignal *)sourceSignal {
    if (!_sourceSignal) {
        _sourceSignal = [RACObserve(self, models) deliverOn:[RACScheduler mainThreadScheduler]];
    }
    return _sourceSignal;
}

- (RACCommand *)loadCommand {
    self.hasMoreData = NO;
    self.page = 0;
    self.perPage = 10;
    
    if (_loadCommand) return _loadCommand;
    
    @weakify(self);
    _loadCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self loadDataSignal];
    }];
    
    return _loadCommand;
}

- (RACCommand *)loadMoreCommand {
    if (_loadMoreCommand) return _loadMoreCommand;
    
    @weakify(self);
    _loadMoreCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self loadDataSignal];
    }];
    
    return _loadMoreCommand;
}

- (nonnull RACSignal *)loadDataFromPage:(NSUInteger)page perPage:(NSUInteger)perPage {
    return [RACSignal empty];
}

- (RACCommand *)selectCommand {
    return nil;
}

#pragma mark - private
- (RACSignal *)loadDataSignal {
    @weakify(self);
    return [[[self loadDataFromPage:self.page perPage:self.perPage] doNext:^(NSArray* x) {
        @strongify(self);
        
        assert([x isKindOfClass:[NSArray class]]);
        
        if (self.page == 0) { // 重新加载
            self.models = [[NSMutableArray alloc] initWithArray:x ? : @[]];
        } else  {             // 加载更多
            if (x.count > 0) {
                NSMutableArray *a = [[NSMutableArray alloc] initWithArray:self.models ? : @[]];
                [a addObjectsFromArray:x];
                
                self.models = a;
            }
        }
        
        if (x.count < self.perPage) {
            self.hasMoreData = NO;
        } else {
            self.hasMoreData = YES;
            self.page += 1;
        }
    }] doError:^(NSError *error) {
        self.hasMoreData = NO;
    }];
}

- (BOOL)deleteModelAtIndex:(NSUInteger)index {
    NSMutableArray *ma = (NSMutableArray *)self.models;
    if (index < self.models.count && [ma isKindOfClass:[NSMutableArray class]]) {
        [ma removeObjectAtIndex:index];
        if (ma.count == 0) {
            self.models = [[NSMutableArray alloc] init];
        }
        return YES;
    }
    
    return NO;
}

- (void) removeAllModels {
    self.models = [[NSMutableArray alloc] init];
}

@end
