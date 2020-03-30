//
//  PERHomeViewListCell.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERHomeViewListCell.h"

@interface PERHomeViewListCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitltLabel;

@end

@implementation PERHomeViewListCell

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
        make.size.mas_equalTo(CGSizeMake(120, 80));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(20);
        make.top.equalTo(@15);
        make.height.equalTo(@18);
        make.right.equalTo(@-12);
    }];
    
    [self.subTitltLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.right.equalTo(@-12);
        make.height.mas_lessThanOrEqualTo(@90);
    }];
}

- (void)bindViewModel:(PERHomeViewListCellViewModel<PERViewModelProtocol> *)viewModel {
    [self.imgView setImage:[UIImage imageNamed:viewModel.item.imgName]];
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
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    
    return _titleLabel;
}

- (UILabel *)subTitltLabel {
    if (_subTitltLabel) return _subTitltLabel;
    
    _subTitltLabel = [UILabel new];
    _subTitltLabel.font = [UIFont boldSystemFontOfSize:13];
    _subTitltLabel.numberOfLines = 0;
    _subTitltLabel.textColor = UIColorFromRGB(0x5c5d5d);
    
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


@implementation PERHomeViewListCellViewModel

+ (nullable Class)cellClass {
    return PERHomeViewListCell.class;
}

- (CGFloat)height {
    return 130.f;
}

@end
