//
//  UIView+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/1/18.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIView+TPAddition.h"

@implementation UIView (TPAddition)

- (void)tp_setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)tp_setBorderWidth:(CGFloat)width andColor:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (UIViewController *)viewController {
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIImage *)tp_convertViewToImage {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

// 找到某个视图上的是第一响应对象的子视图
+ (UIView *)tp_findFirstResponderSubViewBeneathView:(UIView *)view {
    // Search recursively for first responder
    for ( UIView *subView in view.subviews ) {
        if ( [subView respondsToSelector:@selector(isFirstResponder)] && [subView isFirstResponder] )
            return subView;
        UIView *result = [self tp_findFirstResponderSubViewBeneathView:subView];
        if (result)
            return result;
    }
    return nil;
}

@end
