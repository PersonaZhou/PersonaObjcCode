//
//  PERHomeViewBannerCell.m
//  PersonaObjcCode
//
//  Created by Persona on 2020/1/5.
//  Copyright © 2020 ZhouShisong. All rights reserved.
//

#import "PERHomeViewBannerCell.h"
#import "PERCarouselView.h"

@interface PERHomeViewBannerCell()

@property (nonatomic, strong) PERCarouselView *carouselView;

@end

@implementation PERHomeViewBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self makeConstraints];
    }
    
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self addSubview:self.carouselView];
}

- (void)makeConstraints {
    [self.carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)bindViewModel:(PERHomeViewBannerCellViewModel<PERViewModelProtocol> *)viewModel {
    NSMutableArray *t = [NSMutableArray array];
    for (PERHomeListItem *item in viewModel.banners) {
        PERCarouselViewModel *model = PERCarouselViewModel.new;
        model.title = item.title;
        model.imgName = item.imgName;
        model.url = item.url;
        [t addObject:model];
    }
    
    [self.carouselView setCardListData:t];
}

- (PERCarouselView *)carouselView {
    if (_carouselView) return _carouselView;
    
    _carouselView = PERCarouselView.new;
    
    return _carouselView;
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


@implementation PERHomeViewBannerCellViewModel

+ (nullable Class)cellClass {
    return PERHomeViewBannerCell.class;
}

- (CGFloat)height {
    return [PERCarouselView viewHeight];
}

@end
