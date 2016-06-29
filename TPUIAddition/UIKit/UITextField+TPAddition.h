//
//  UITextField+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TPAddition)

+ (instancetype)tp_textFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                          borderStyle:(UITextBorderStyle)borderStyle
                         keyboardType:(UIKeyboardType)keyboardType
                        returnKeyType:(UIReturnKeyType)returnKeyType
                            textColor:(UIColor *)textColor
                                 font:(UIFont *)font
                      clearButtonMode:(UITextFieldViewMode)clearButtonMode
                                  sec:(BOOL)sec;

@end
