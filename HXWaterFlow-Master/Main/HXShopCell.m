//
//  HXShopCell.m
//  HXWaterFlow-Master
//
//  Created by hexuan on 2019/8/1.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "HXShopCell.h"

@interface HXShopCell()

@property(nonatomic,strong)UIImageView *iconView;

@property(nonatomic,strong)UILabel *priceLabel;

@end

@implementation HXShopCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
        [self layout];
        [self addEvent];
        [self getData];
    }return self;
}

- (void)setShop:(HXShopModel *)shop{
    _shop = shop;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    self.priceLabel.text = shop.price;
}

- (void)setUI{
    [self addSubview:self.iconView];
    [self addSubview:self.priceLabel];
}

- (void)layout{
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.iconView);
        make.height.equalTo(@50);
    }];
    
}
- (void)getData{}
- (void)addEvent{}

- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }return _iconView;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.font = KFont(16);
    }return _priceLabel;
}

@end
