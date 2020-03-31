//
//  PERYogaOptionCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERYogaOptionCell.h"

@interface PERYogaOptionCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation PERYogaOptionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = UIColorFromRGB(0xffffff);
        [self setupView];
        [self makeFlexBox];
    }
    
    return self;
}

- (void)bindModel:(PERYogaOptionModel *)model {
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
}

- (void)setupView {
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.iconImageView];
    [self.bgView addSubview:self.titleLabel];
}

- (void)makeFlexBox {
    [self.contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignCenter;
    }];
    
    [self.bgView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignCenter;
        layout.left = YGPointValue(12);
        layout.width = YGPointValue(UIScreen.mainScreen.bounds.size.width - 24);
        layout.height = YGPointValue(50);
    }];
    
    [self.iconImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginLeft = YGPointValue(12);
        layout.width = YGPointValue(25);
        layout.height = YGPointValue(25);
    }];
    
    [self.titleLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginLeft = YGPointValue(15);
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(20);
    }];
    
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
}

- (UIView *)bgView {
    if (_bgView) return _bgView;
    
    _bgView = [UIView new];
    _bgView.backgroundColor = UIColorFromRGB(0x88a1de);
    
    return _bgView;
}

- (UIImageView *)iconImageView {
    if (_iconImageView) return _iconImageView;
    
    _iconImageView = [UIImageView new];
    
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    
    _titleLabel = UILabel.new;
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    return _titleLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
