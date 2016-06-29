//
//  CALayer+TP_XibAddition.m
//  TPUIAddition
//
//  Created by PengTao on 15/12/17.
//  Copyright © 2015年 CoderTPeng. All rights reserved.
//

#import "CALayer+TP_XibAddition.h"
#import <UIKit/UIKit.h>

@implementation CALayer (TP_XibAddition)

- (void)setBorderColorFromUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
