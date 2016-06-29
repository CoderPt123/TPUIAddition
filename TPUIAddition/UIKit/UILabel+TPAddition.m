//
//  UILabel+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UILabel+TPAddition.h"

@implementation UILabel (TPAddition)

+ (instancetype)tp_labelWithFrame:(CGRect)frame
                             text:(NSString*)text
                        textColor:(UIColor*)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    
    if (text) {
        label.text = text;
    }
    
    if (textColor) {
        label.textColor = textColor;
    }
    
    if (font) {
        label.font = font;
    }
    
    label.textAlignment = textAlignment;
    
    return label;
}


+ (instancetype)tp_labelWithAutoWidthOfFrame:(CGRect)frame
                                        text:(NSString*)text
                                   textColor:(UIColor*)textColor
                                        font:(UIFont *)font
                               textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel * label = [UILabel tp_labelWithFrame:frame
                                            text:text
                                       textColor:textColor
                                            font:font
                                   textAlignment:textAlignment];
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(frame.size.width, 0)
                                     options:1
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil].size;
    
    CGRect rect = frame;
    rect.size.width = size.width;
    label.frame = rect;
    
    return label;
}

@end
