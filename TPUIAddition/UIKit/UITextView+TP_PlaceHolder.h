//
//  UITextView+TP_PlaceHolder.h
//  TPUIAddition
//
//  Created by TP on 16/6/28.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TP_PlaceHolder)

@property (nonatomic, copy) NSString *tp_placeHolder;
@property (nonatomic, copy) NSAttributedString *tp_placeHolderAttributedText;
@property (nonatomic, strong) UIFont *tp_placeHolderFont;
@property (nonatomic, strong) UIColor *tp_placeHolderColor;
@property (nonatomic, assign) CGFloat tp_placeHolderOffsetY;   // 默认5

@end
