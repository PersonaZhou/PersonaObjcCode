//
//  PERCustomListCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCustomListCell.h"

@interface PERCustomListCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitltLabel;

@end

@implementation PERCustomListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self makeConstraints];
    }
    
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self addSubview:self.imgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitltLabel];
}

- (void)makeConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(80, 120));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(10);
        make.top.equalTo(@18);
    }];
    
    [self.subTitltLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.equalTo(@-20);
    }];
}

- (void)bindViewModel:(PERCustomListCellViewModel<PERViewModelProtocol> *)viewModel {
    [self.imgView setImage:[UIImage imageNamed:viewModel.item.thumbnail]];
    [self.titleLabel setText:viewModel.item.title];
    [self.subTitltLabel setText:viewModel.item.introduction];
}

- (UIImageView *)imgView {
    if (_imgView) return _imgView;
    
    _imgView = [UIImageView new];
    _imgView.layer.cornerRadius = 5;
    _imgView.layer.masksToBounds = YES;
    
    return _imgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    _titleLabel.textColor = UIColorFromRGB(0x2c302e);
    
    return _titleLabel;
}

- (UILabel *)subTitltLabel {
    if (_subTitltLabel) return _subTitltLabel;
    
    _subTitltLabel = [UILabel new];
    _subTitltLabel.font = [UIFont boldSystemFontOfSize:14];
    _subTitltLabel.numberOfLines = 5;
    _subTitltLabel.textColor = UIColorFromRGB(0x424946);
    
    return _subTitltLabel;
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


@implementation PERCustomListCellViewModel

+ (nullable Class)cellClass {
    return PERCustomListCell.class;
}

- (CGFloat)height {
    return 150.f;
}

@end
