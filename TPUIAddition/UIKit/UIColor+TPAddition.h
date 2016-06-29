//
//  UIColor+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/1/18.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TPCOLOR_HEX(...) [UIColor tp_colorWithHex:(__VA_ARGS__)]

@interface UIColor (TPAddition)

/** 16进制转UIColor */
+ (UIColor *)tp_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/** 16进制转UIColor */
+ (UIColor *)tp_colorWithHex:(NSInteger)hexValue;

/** UIColor转16进制字符串 */
+ (NSString *)tp_hexFromUIColor:(UIColor *) color;

@end
