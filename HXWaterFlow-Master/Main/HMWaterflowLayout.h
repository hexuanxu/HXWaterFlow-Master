//
//  HMWaterflowLayout.h
//  HXWaterFlow-Master
//
//  Created by hexuan on 2019/8/1.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMWaterflowLayout;
@protocol HXWaterflowLayoutDelegate <NSObject>

@required

- (CGFloat)waterflowLayout:(HMWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;

@end

@interface HMWaterflowLayout : UICollectionViewLayout


//@property (nonatomic, assign) UIEdgeInsets edgeInsets;
/** 每一列之间的间距 */
//@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
//@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
//@property (nonatomic, assign) int columnCount;

@property(nonatomic,weak)id<HXWaterflowLayoutDelegate> delegate;

@end
