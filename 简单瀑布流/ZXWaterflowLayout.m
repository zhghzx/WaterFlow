//
//  ZXWaterflowLayout.m
//  简单瀑布流
//
//  Created by zhangxing on 2017/6/16.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ZXWaterflowLayout.h"


static const CGFloat LineGap = 10;

static const CGFloat ColumnGap = 10;

static const UIEdgeInsets DefaultInsets = {10,10,10,10};

static const int DefaultColumnsCount = 3;

@interface ZXWaterflowLayout ()

@property (nonatomic, strong) NSMutableArray *columnMaxYArr;

@property (nonatomic, strong) NSMutableArray *cellPropertyArr;

@end

@implementation ZXWaterflowLayout

- (NSMutableArray *)columnMaxYArr {
    if (_columnMaxYArr == nil) {
        _columnMaxYArr = [[NSMutableArray alloc] init];
    }
    return _columnMaxYArr;
}

- (NSMutableArray *)cellPropertyArr {
    if (_cellPropertyArr == nil) {
        _cellPropertyArr = [[NSMutableArray array] init];
    }
    return _cellPropertyArr;
}

- (CGSize)collectionViewContentSize {
    //找出最长列
    CGFloat maxY = [self.columnMaxYArr[0] doubleValue];
    for (NSUInteger i=1; i<self.columnMaxYArr.count; i++) {
        CGFloat columnMaxY = [self.columnMaxYArr[i] doubleValue];
        if (maxY < columnMaxY) {
            maxY = columnMaxY;
        }
    }
    return CGSizeMake(0, maxY + DefaultInsets.bottom);
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.columnMaxYArr removeAllObjects];
    for (NSUInteger i=0; i<DefaultColumnsCount; i++) {
        [self.columnMaxYArr addObject:@(DefaultInsets.top)];
    }
    
    [self.cellPropertyArr removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.cellPropertyArr addObject:att];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.cellPropertyArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat xGap = DefaultInsets.left + DefaultInsets.right + (DefaultColumnsCount - 1) * ColumnGap;
    
    CGFloat cellW = (self.collectionView.frame.size.width - xGap) /DefaultColumnsCount;
    
    CGFloat cellH = 50 + arc4random()%100;
    
    CGFloat minY = [self.columnMaxYArr[0] doubleValue];
    NSUInteger minColumn = 0;
    for (NSUInteger i=1; i<self.columnMaxYArr.count; i++) {
        CGFloat columnY = [self.columnMaxYArr[i] doubleValue];
        if (minY>columnY) {
            minY = columnY;
            minColumn = i;
        }
    }
    
    CGFloat cellX = DefaultInsets.left + minColumn * (cellW + ColumnGap);
    
    CGFloat cellY = minY + LineGap;
    
    att.frame = CGRectMake(cellX, cellY, cellW, cellH);
    
    self.columnMaxYArr[minColumn] = @(CGRectGetMaxY(att.frame));
    
    return att;
    
}

@end
