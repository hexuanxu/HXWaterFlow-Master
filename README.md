# HXWaterFlow-Master
瀑布流

/* 代理方法  HXWaterflowLayoutDelegate */

1. 获取每个item的高度
@required
- (CGFloat)waterflowLayout:(HMWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
2. 设置参数

/** 瀑布流的列数 */
- (CGFloat)columnCountInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
/** 每一列之间的间距 */
- (CGFloat)columnMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
/** 每一行之间的间距 */
- (CGFloat)rowMarginInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
/** 边缘间距 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(HMWaterflowLayout *)waterflowLayout;
