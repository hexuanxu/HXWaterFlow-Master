//
//  MainViewController.m
//  HXWaterFlow-Master
//
//  Created by hexuan on 2019/8/1.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "MainViewController.h"
#import "HXShopModel.h"
#import "HXShopCell.h"
#import "HMWaterflowLayout.h"

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,HXWaterflowLayoutDelegate>

@property(nonatomic,strong)UICollectionView *shopCollectionView;

@property(nonatomic,strong)NSArray *dataSources;

@end

static NSString * const HXShopCellID = @"HXShopCell";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"瀑布流";
    [self setUI];
    [self layout];
    [self addEvent];
    [self getData];
}

- (void)setUI{
    [self.view addSubview:self.shopCollectionView];
}
- (void)layout{}
- (void)getData{}
- (void)addEvent{}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSources.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HXShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HXShopCellID forIndexPath:indexPath];
    cell.shop = [self.dataSources safeObjectAtIndex:indexPath.row];
    return cell;
}


#pragma mark --- <HXWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(HMWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth{
    
    HXShopModel *shop = [self.dataSources safeObjectAtIndex:index];
    
    return itemWidth * shop.h / shop.w ;
}

- (CGFloat)columnCountInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout{
    return 4;
}
- (CGFloat)columnMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout{
    return 10;
}
- (CGFloat)rowMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout{
    return 10;
}
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark --- <getting>
- (UICollectionView *)shopCollectionView{
    
    if (!_shopCollectionView) {
        
        HMWaterflowLayout *layout = [[HMWaterflowLayout alloc] init];
        layout.delegate =self;
        _shopCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) collectionViewLayout:layout];
        _shopCollectionView.delegate = self;
        _shopCollectionView.dataSource = self;
        _shopCollectionView.showsVerticalScrollIndicator = NO;
        [_shopCollectionView registerClass:[HXShopCell class] forCellWithReuseIdentifier:HXShopCellID];
    }return _shopCollectionView;
}


- (NSArray *)dataSources{
    if (!_dataSources) {
        NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        NSArray *datas = [NSArray arrayWithContentsOfFile:pathStr];
        _dataSources = [HXShopModel mj_objectArrayWithKeyValuesArray:datas];
    }return _dataSources;
}



@end
