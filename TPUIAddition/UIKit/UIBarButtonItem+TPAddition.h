//
//  UIBarButtonItem+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/4/19.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TPAddition)

/**  快速创建一个UIBarButtonItem对象 */
+ (instancetype)tp_barButtonItemWithBackgroundImage:(UIImage *)backgroundImage
                                   highlightedImage:(UIImage *)highlightedImage
                                             target:(id)target
                                             action:(SEL)action
                                   forControlEvents:(UIControlEvents)controlEvents;


@end
