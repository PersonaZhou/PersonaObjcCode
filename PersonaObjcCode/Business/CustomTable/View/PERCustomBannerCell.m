//
//  PERCustomBannerCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/28.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCustomBannerCell.h"
#import "PERRecordView.h"

@class PERRecordModel;

@interface PERCustomBannerCell()

@property (nonatomic, strong) UIView *blockView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) PERRecordView *recordView;

@end

@implementation PERCustomBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self makeConstraints];
    }
    
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self.contentView addSubview:self.blockView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.recordView];
}

- (void)makeConstraints {
    [self.blockView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(5, 18));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blockView.mas_right).offset(10);
        make.centerY.equalTo(self.blockView);
    }];
    
    [self.recordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.blockView.mas_bottom).offset(10);
    }];
}

- (void)bindViewModel:(PERCustomBannerCellViewModel<PERViewModelProtocol> *)viewModel {
    NSMutableArray *t = [NSMutableArray array];
    for (PERCustomTableBannerModel *bannerModel in viewModel.banners) {
        PERRecordModel *model = PERRecordModel.new;
        model.title = bannerModel.title;
        [t addObject:model];
    }
    [self.recordView updateData:t];
}

- (UIView *)blockView {
    if (_blockView) return _blockView;
    
    _blockView = UIView.new;
    _blockView.backgroundColor = UIColorFromRGB(0xff665f);
    _blockView.layer.cornerRadius = 3;
    
    return _blockView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) return _titleLabel;
    
    _titleLabel = UILabel.new;
    _titleLabel.text = @"热门书籍";
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    _titleLabel.textColor = UIColorFromRGB(0x242524);
    
    return _titleLabel;
}

- (PERRecordView *)recordView {
    if (_recordView) return _recordView;
    
    _recordView = [PERRecordView new];
    
    return _recordView;
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


@implementation PERCustomBannerCellViewModel

+ (nullable Class)cellClass {
    return PERCustomBannerCell.class;
}

- (CGFloat)height {
    return 200.f;
}


@end
