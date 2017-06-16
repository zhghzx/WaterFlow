//
//  ViewController.m
//  简单瀑布流
//
//  Created by zhangxing on 2017/6/16.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ViewController.h"
#import "ZXCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    ZXCollectionViewController *vc= [[ZXCollectionViewController alloc] initWithFlowLayoutType:ZXCollectionViewFlowLayoutTypeCustom];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pushSystem:(id)sender {
    ZXCollectionViewController *vc= [[ZXCollectionViewController alloc] initWithFlowLayoutType:ZXCollectionViewFlowLayoutTypeSystem];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
