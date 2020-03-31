//
//  PERYogaUserInfoCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/31.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERYogaUserInfoCell.h"

@interface PERYogaUserInfoCell ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIView *infoView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *emailLabel;

@end

@implementation PERYogaUserInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupView];
        [self makeFlexBox];
        [self bindEvent];
    }
    
    return self;
}

- (void)bindModel:(PERYogaInfoModel *)model {
    self.avatarImageView.image = [UIImage imageNamed:model.avatar];
    self.nicknameLabel.text = model.nickname;
    self.addressLabel.text = model.address;
    self.emailLabel.text = model.email;
}

- (void)setupView {
    [self.contentView addSubview:self.headerView];
    [self.headerView addSubview:self.avatarImageView];
    [self.headerView addSubview:self.infoView];
    [self.infoView addSubview:self.nicknameLabel];
    [self.infoView addSubview:self.addressLabel];
    [self.infoView addSubview:self.emailLabel];
}

- (void)makeFlexBox {
    [self.contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignFlexStart;
    }];
    
    [self.headerView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection = YGFlexDirectionRow;
        layout.height = YGPointValue(120);
        layout.width = YGPointValue(UIScreen.mainScreen.bounds.size.width - 30);
        layout.top = YGPointValue(10);
        layout.marginLeft = YGPointValue(12);
        layout.marginRight = YGPointValue(12);
        layout.padding =  YGPointValue(10);
        layout.flexGrow = 2;
        layout.alignItems = YGAlignCenter;
    }];
    
    [self.avatarImageView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(60);
        layout.height = YGPointValue(60);
    }];
    
    [self.infoView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = true;
        layout.flexGrow = 10;
        layout.padding = YGPointValue(5);
        layout.flexDirection = YGFlexDirectionColumn;
        layout.marginLeft = YGPointValue(5);
    }];
    
    [self.nicknameLabel configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.height = YGPointValue(20);
        layout.top = YGPointValue(5);
        layout.marginBottom = YGPointValue(10);
        layout.marginLeft = YGPointValue(5);
    }];
    
    [self.addressLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(5);
    }];
    
    [self.emailLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(5);
        layout.marginLeft = YGPointValue(5);
    }];
    
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
}

- (void)bindEvent {
    
}

- (UIView *)headerView {
    if (_headerView) return _headerView;
    
    _headerView = UIView.new;
    _headerView.backgroundColor = UIColorFromRGB(0xf3fffe);
    
    return _headerView;
}

- (UIImageView *)avatarImageView {
    if(_avatarImageView) return _avatarImageView;
    
    _avatarImageView = UIImageView.new;
    _avatarImageView.layer.cornerRadius = 5;
    _avatarImageView.layer.masksToBounds = YES;
    
    return _avatarImageView;
}

- (UIView *)infoView {
    if (_infoView) return _infoView;
    
    _infoView = UIView.new;
    _infoView.backgroundColor = UIColorFromRGB(0xdcdede);
    
    return _infoView;
}

- (UILabel *)nicknameLabel {
    if (_nicknameLabel) return _nicknameLabel;
    
    _nicknameLabel = UILabel.new;
    _nicknameLabel.font = [UIFont boldSystemFontOfSize:18];
    
    return _nicknameLabel;
}

- (UILabel *)addressLabel {
    if (_addressLabel) return _addressLabel;
    
    _addressLabel = UILabel.new;
    _addressLabel.font = [UIFont systemFontOfSize:15];
    
    return _addressLabel;
}

- (UILabel *)emailLabel {
    if (_emailLabel) return _emailLabel;
    
    _emailLabel = UILabel.new;
    _emailLabel.font = [UIFont systemFontOfSize:15];
    
    return _emailLabel;
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
