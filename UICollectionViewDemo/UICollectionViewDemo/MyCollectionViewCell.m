//
//  MyCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by 李林 on 2017/6/10.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "UIColor+RandomColor.h"

@interface MyCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIView *centerView;

@end

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor randomColor];
}

@end
