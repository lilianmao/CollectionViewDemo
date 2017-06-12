//
//  MyFlowLayout.h
//  UICollectionViewDemo
//
//  Created by 李林 on 2017/6/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required

/**
 决定cell的高度
 */
- (CGFloat)waterFlowLayout:(WaterFlowLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;

@optional
- (NSInteger)columnCountInWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;

- (CGFloat)columnMarginInWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;

- (CGFloat)rowMarginInWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;

- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;

@end

@interface WaterFlowLayout : UICollectionViewFlowLayout

- (NSInteger)columnCount;
- (CGFloat)columnMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;

@property (nonatomic, weak) id<WaterFlowLayoutDelegate> delegate;

@end
