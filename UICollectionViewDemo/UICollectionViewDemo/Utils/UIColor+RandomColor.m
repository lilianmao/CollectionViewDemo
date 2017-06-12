//
//  UIColor+RandomColor.m
//  UICollectionViewDemo
//
//  Created by 李林 on 2017/6/12.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor {
    CGFloat hue = arc4random() % 256 / 256.0;
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightnedd = (arc4random() % 128 / 256.0) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightnedd alpha:1];
}

@end
