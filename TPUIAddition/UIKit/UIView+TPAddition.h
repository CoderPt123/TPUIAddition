//
//  UIView+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/1/18.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TPAddition)

- (void)tp_setCornerRadius:(CGFloat)cornerRadius;
- (void)tp_setBorderWidth:(CGFloat)width andColor:(UIColor *)color;

- (UIImage *)tp_convertViewToImage;

/** view所属的viewController */
- (UIViewController *)viewController;

/** 找到某个视图上，为第一响应对象的子视图 */
+ (UIView *)tp_findFirstResponderSubViewBeneathView:(UIView *)view;

@end
