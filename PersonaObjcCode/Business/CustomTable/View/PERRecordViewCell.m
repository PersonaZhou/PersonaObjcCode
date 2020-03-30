//
//  PERRecordViewCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/30.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERRecordViewCell.h"

@interface PERRecordViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation PERRecordViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self makeConstraints];
    }
    
    return self;
}

- (void)bindModel:(PERRecordModel *)model {
    self.titleLabel.text = model.title;
}

- (void)setupUI {
    self.contentView.layer.cornerRadius = 15;
    self.contentView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)makeConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
}

- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    
    _titleLabel = UILabel.new;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.textColor = UIColorFromRGB(0xff4e47);
    _titleLabel.backgroundColor = UIColorFromRGB(0xffa09f);
    
    return _titleLabel;
}

@end
