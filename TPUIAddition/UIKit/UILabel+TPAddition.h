//
//  UILabel+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TPAddition)

+ (instancetype)tp_labelWithFrame:(CGRect)frame
                             text:(NSString*)text
                        textColor:(UIColor*)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment;

+ (instancetype)tp_labelWithAutoWidthOfFrame:(CGRect)frame
                                        text:(NSString*)text
                                   textColor:(UIColor*)textColor
                                        font:(UIFont *)font
                               textAlignment:(NSTextAlignment)textAlignment;

@end
