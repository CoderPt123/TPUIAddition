//
//  UIButton+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TPAddition)

/** button : params only image */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

/** button : params only backgroundImage */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                   backgroundImage:(UIImage *)backgroundImage
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

/** button : params only title */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

/** button : 文字在左，图片在右 */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                       titleAtLeft:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

/** button : 文字在下，图片在上 */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                     titleAtBottom:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;


#pragma mark - CGRectZero

/** button : params only image and CGRectZero */
+ (instancetype)tp_buttonWithImage:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

/** button : params only title and CGRectZero */
+ (instancetype)tp_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

#pragma mark - params full

/** button : params full */
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                   backgroundImage:(UIImage *)backgroundImage
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent;

@end
