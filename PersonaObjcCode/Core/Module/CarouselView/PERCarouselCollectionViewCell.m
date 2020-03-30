//
//  PERCarouselCollectionViewCell.m
//  PersonaObjcCode
//
//  Created by ZhouShisong on 2020/3/29.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERCarouselCollectionViewCell.h"

@interface PERCarouselCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *tagLabel;

@end

@implementation PERCarouselCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.layer.shadowOffset = CGSizeMake(0, 3);
        self.contentView.layer.shadowRadius = 5;
        self.contentView.layer.shadowOpacity = 0.2;
        [self setupUI];
        [self layout];
    }
    return self;
}

- (void)setCellImageName:(NSString *)imageName {
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (void)setupUI {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.tagLabel];
}

- (void)layout {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(2, 0, 0, 0));
    }];

    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(@0);
    }];
}

- (UIImageView *)imageView {
    if (_imageView) return _imageView;
    
    _imageView = UIImageView.new;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;
    
    return _imageView;
}

- (UILabel *)tagLabel {
    if (_tagLabel) return _tagLabel;
    
    _tagLabel = UILabel.new;
    _tagLabel.numberOfLines = 1;
    _tagLabel.font = [UIFont systemFontOfSize:20];
    _tagLabel.textColor = [UIColor blackColor];
    _tagLabel.textAlignment = NSTextAlignmentCenter;
    
    return _tagLabel;
}


@end
