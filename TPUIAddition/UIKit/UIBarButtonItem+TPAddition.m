//
//  UIBarButtonItem+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/4/19.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIBarButtonItem+TPAddition.h"

@implementation UIBarButtonItem (TPAddition)

+ (instancetype)tp_barButtonItemWithBackgroundImage:(UIImage *)backgroundImage
                                   highlightedImage:(UIImage *)highlightedImage
                                             target:(id)target
                                             action:(SEL)action
                                   forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    if (highlightedImage != nil) {
        [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    // 必须要设置控件尺寸，这里选择根据内容自适应
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
