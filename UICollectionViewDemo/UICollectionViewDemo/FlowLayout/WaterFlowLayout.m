//
//  MyFlowLayout.m
//  UICollectionViewDemo
//
//  Created by 李林 on 2017/6/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "WaterFlowLayout.h"

static const CGFloat columnCount = 3;
static const CGFloat columnMargin = 10;
static const CGFloat rowMargin = 10;
static const UIEdgeInsets defaultEdgeInsets = {10, 10, 10, 10};

@interface WaterFlowLayout()

@property (nonatomic, strong) NSMutableArray *attrsArray;       // 布局属性数组
@property (nonatomic, strong) NSMutableArray *columnHeight;     // 存放所有列的当前高度

@end

@implementation WaterFlowLayout

#pragma mark - Lazy Load

- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeight {
    if (!_columnHeight) {
        _columnHeight = [NSMutableArray array];
    }
    return _columnHeight;
}

#pragma mark - Layout

- (void)prepareLayout {
    [super prepareLayout];
    
    [_columnHeight removeAllObjects];
    for (int i=0; i<columnCount; i++) {
        [self.columnHeight addObject:@(defaultEdgeInsets.top)];
    }
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    [_attrsArray removeAllObjects];
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [_attrsArray addObject:attr];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [_columnHeight[0] doubleValue];
    
    for(int i=1; i<self.columnCount; i++) {
        CGFloat columnHeight = [_columnHeight[0] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat w = (self.collectionView.frame.size.width - defaultEdgeInsets.left - defaultEdgeInsets.right - (columnCount - 1) * columnMargin) / columnCount;
    CGFloat h = [self.delegate waterFlowLayout:self heightForRowAtIndex:indexPath.item itemWidth:w];
    CGFloat x = defaultEdgeInsets.left + destColumn * (w + columnMargin);
    CGFloat y = minColumnHeight;
    
    if (y != defaultEdgeInsets.top) {
        y += rowMargin;
    }
    
    attr.frame = CGRectMake(x, y, w, h);
    _columnHeight[destColumn] = @(y+h);
    
    return attr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attrsArray;
}

- (CGSize)collectionViewContentSize {
    CGFloat maxHeight = [_columnHeight[0] doubleValue];
    for (int i=1; i<self.columnCount; i++) {
        CGFloat value = [_columnHeight[i] doubleValue];
        if (maxHeight < value) {
            maxHeight = value;
        }
    }
    return CGSizeMake(0, maxHeight + defaultEdgeInsets.bottom);
}

@end
