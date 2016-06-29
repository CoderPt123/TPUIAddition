//
//  UIViewController+TP_Keyboard.h
//  TPUIAddition
//
//  Created by PengTao on 16/3/19.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TP_Keyboard)

/* 手动开启观察键盘通知 */
- (void)tp_openObserveKeyboardNotification;
/* 手动关闭观察键盘通知：可不手动关闭，dealloc时会自动关闭 */
- (void)tp_closeObserveKeyboardNotification;

/* 键盘显示 */
- (void)tp_keyboardWillAppear:(NSNotification *)sender;
/* 键盘隐藏 */
- (void)tp_keyboardWillDisappear:(NSNotification *)sender;

/** 计算键盘的高度：通过键盘弹出/关闭NSNotification对象的userInfo属性可以获取键盘的信息 */
- (CGFloat)tp_keyboardEndingFrameHeight:(NSDictionary *)userInfo;

@end
