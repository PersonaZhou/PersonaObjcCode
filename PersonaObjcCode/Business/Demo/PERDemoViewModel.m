//
//  PERDemoViewModel.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/1/16.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERDemoViewModel.h"
#import "PERYogaViewModel.h"
#import "PERTextureViewModel.h"
#import "PERCustomTableViewModel.h"

@interface PERDemoViewModel ()

@property (nonatomic, copy, readwrite) NSArray<PERDemoModel *> *listArray;

@property (nonatomic, strong, readwrite) RACCommand *selectCommand;

@end

@implementation PERDemoViewModel

- (NSArray *)listArray {
    if (_listArray) return _listArray;
    
    PERDemoModel *yogaModel = PERDemoModel.new;
    yogaModel.type = PERDemoItemTypeYoga;
    yogaModel.title = @"YogaKit";
    
    PERDemoModel *textureModel = PERDemoModel.new;
    textureModel.type = PERDemoItemTypeTexture;
    textureModel.title = @"Texture(AsyncDisplayKit)";
    
    PERDemoModel *customModel = PERDemoModel.new;
    customModel.type = PERDemoItemTypeCustomTable;
    customModel.title = @"PERDemoItemTypeCustomTable";
    
    _listArray = @[yogaModel, textureModel, customModel];
    
    return _listArray;
}

- (RACCommand *)selectCommand {
    if (_selectCommand) return _selectCommand;
    
    @weakify(self);
    _selectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(PERDemoModel *input) {
        @strongify(self);
        if ([input isKindOfClass:PERDemoModel.class]) {
            if (input.type == PERDemoItemTypeYoga) {
                PERYogaViewModel *viewModel = [[PERYogaViewModel alloc] initWithServices:self.services];
                [self.services.navigater pushViewModel:viewModel animated:YES];
            }else if (input.type == PERDemoItemTypeTexture) {
                PERTextureViewModel *viewModel = [[PERTextureViewModel alloc] initWithServices:self.services];
                [self.services.navigater pushViewModel:viewModel animated:YES];
            }else if (input.type == PERDemoItemTypeCustomTable) {
                PERCustomTableViewModel *viewModel = [[PERCustomTableViewModel alloc] initWithServices:self.services];
                [self.services.navigater pushViewModel:viewModel animated:YES];
            }
        }
        
        return [RACSignal empty];
    }];

    return _selectCommand;
}

@end
