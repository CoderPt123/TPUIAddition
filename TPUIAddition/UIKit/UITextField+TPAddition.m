//
//  UITextField+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UITextField+TPAddition.h"

@implementation UITextField (TPAddition)

+ (instancetype)tp_textFieldWithFrame:(CGRect)frame
                       placeholder:(NSString *)placeholder
                       borderStyle:(UITextBorderStyle)borderStyle
                      keyboardType:(UIKeyboardType)keyboardType
                     returnKeyType:(UIReturnKeyType)returnKeyType
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                   clearButtonMode:(UITextFieldViewMode)clearButtonMode
                               sec:(BOOL)sec {
    
    UITextField * textField = [[UITextField alloc] initWithFrame:frame];
    
    if (placeholder) {
        textField.placeholder = placeholder;
    }
    
    if (textColor) {
        textField.textColor = textColor;
    }
    
    if (font) {
        textField.font = font;
    }
    
    textField.borderStyle = borderStyle;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    
    textField.clearButtonMode = clearButtonMode;
    textField.secureTextEntry = sec;
    
    return textField;
}

@end
