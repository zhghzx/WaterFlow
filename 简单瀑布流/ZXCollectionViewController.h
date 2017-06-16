//
//  ZXCollectionViewController.h
//  简单瀑布流
//
//  Created by zhangxing on 2017/6/16.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZXCollectionViewFlowLayoutTypeSystem,
    ZXCollectionViewFlowLayoutTypeCustom,
} ZXCollectionViewFlowLayoutType;

@interface ZXCollectionViewController : UICollectionViewController

- (instancetype)initWithFlowLayoutType:(ZXCollectionViewFlowLayoutType)flowLayoutType;

@end
