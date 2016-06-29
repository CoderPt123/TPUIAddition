//
//  UIButton+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIButton+TPAddition.h"

@implementation UIButton (TPAddition)

+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                          image:(UIImage *)image
                      addTarget:(id)target
                         action:(SEL)action
                forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton * btn = [UIButton tp_buttonWithFrame:frame
                                            title:nil
                                       titleColor:nil
                                             font:nil
                                  backgroundColor:nil
                                  backgroundImage:nil
                                            image:image
                                        addTarget:target
                                           action:action
                                  forControlEvent:controlEvent];
    
    return btn;
}

+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                   backgroundImage:(UIImage *)backgroundImage
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton * btn = [UIButton tp_buttonWithFrame:frame
                                            title:nil
                                       titleColor:nil
                                             font:nil
                                  backgroundColor:nil
                                  backgroundImage:backgroundImage
                                            image:nil
                                        addTarget:target
                                           action:action
                                  forControlEvent:controlEvent];
    
    return btn;
}

+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton *btn = [UIButton tp_buttonWithFrame:frame
                                           title:title
                                      titleColor:titleColor
                                            font:font
                                 backgroundColor:nil
                                 backgroundImage:nil
                                           image:nil
                                       addTarget:target
                                          action:action
                                 forControlEvent:controlEvent];
    
    return btn;
}

+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                   backgroundImage:(UIImage *)backgroundImage
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = frame;
    
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (font) {
        btn.titleLabel.font = font;
    }
    
    if (backgroundColor) {
        btn.backgroundColor = backgroundColor;
    }
    
    if (backgroundImage) {
        [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    }
    
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    
    if (target) {
        [btn addTarget:target action:action forControlEvents:controlEvent];
    }
    
    return btn;
}

// 文字在左，图片在右
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                       titleAtLeft:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton * btn = [UIButton tp_buttonWithFrame:frame
                                            title:title
                                       titleColor:titleColor
                                             font:font
                                  backgroundColor:nil
                                  backgroundImage:nil
                                            image:image
                                        addTarget:target
                                           action:action
                                  forControlEvent:controlEvent];
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, font.pointSize+2)
                                           options:\
                        NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName: font}
                                           context:nil].size;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width*2, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -titleSize.width*2);
    
    return btn;
}

// 文字在下，图片在上
+ (instancetype)tp_buttonWithFrame:(CGRect)frame
                     titleAtBottom:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                             image:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    
    UIButton * btn = [UIButton tp_buttonWithFrame:frame
                                            title:title
                                       titleColor:titleColor
                                             font:font
                                  backgroundColor:nil
                                  backgroundImage:nil
                                            image:image
                                        addTarget:target
                                           action:action
                                  forControlEvent:controlEvent];
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, font.pointSize+2)
                                           options:\
                        NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName: font}
                                           context:nil].size;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width, -image.size.height-titleSize.height*0.3, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height*1.3, 0, 0, -titleSize.width);
    
    return btn;
}

#pragma mark - CGRectZero

+ (instancetype)tp_buttonWithImage:(UIImage *)image
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    UIButton * btn = [UIButton tp_buttonWithFrame:CGRectZero
                                            title:nil
                                       titleColor:nil
                                             font:nil
                                  backgroundColor:nil
                                  backgroundImage:nil
                                            image:image
                                        addTarget:target
                                           action:action
                                  forControlEvent:controlEvent];
    
    return btn;
}

+ (instancetype)tp_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor*)titleColor
                              font:(UIFont *)font
                         addTarget:(id)target
                            action:(SEL)action
                   forControlEvent:(UIControlEvents)controlEvent {
    UIButton *btn = [UIButton tp_buttonWithFrame:CGRectZero
                                           title:title
                                      titleColor:titleColor
                                            font:font
                                 backgroundColor:nil
                                 backgroundImage:nil
                                           image:nil
                                       addTarget:target
                                          action:action
                                 forControlEvent:controlEvent];
    
    return btn;
}

@end
