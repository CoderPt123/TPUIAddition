//
//  UIViewController+TP_Keyboard.m
//  TPUIAddition
//
//  Created by PengTao on 16/3/19.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIViewController+TP_Keyboard.h"
#import "UIView+TPAddition.h"
#import <objc/runtime.h>

static void *kMoveY = @"kMoveY";
static void *kIsOpenObserveKeyboard = @"kIsOpenObserveKeyboard";

@interface UIViewController ()

@property (nonatomic, assign) CGFloat tp_moveY;
@property (nonatomic, assign) BOOL tp_isOpenObserveKeyboard;

@end

@implementation UIViewController (TP_Keyboard)

- (void)dealloc {
    [self tp_closeObserveKeyboardNotification];
}

// 开启观察键盘通知
- (void)tp_openObserveKeyboardNotification {
    self.tp_isOpenObserveKeyboard = YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tp_keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tp_keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)tp_closeObserveKeyboardNotification {
    if (self.tp_isOpenObserveKeyboard) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        self.tp_isOpenObserveKeyboard = NO;
    }
}

// 计算键盘的高度
- (CGFloat)tp_keyboardEndingFrameHeight:(NSDictionary *)userInfo {
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:[UIApplication sharedApplication].keyWindow];
    return keyboardEndingFrame.size.height;
}

// 键盘显示时：对话视图整体上移（即所有的子视图都上移）
- (void)tp_keyboardWillAppear:(NSNotification *)sender {
    // 通过NSNotification对象的userInfo属性可以获取键盘的信息
    CGFloat hKeyboard = [self tp_keyboardEndingFrameHeight:sender.userInfo];
    UIView *firstResponderView = [UIView tp_findFirstResponderSubViewBeneathView:self.view];
    CGRect rect=[firstResponderView convertRect:firstResponderView.bounds toView:[UIApplication sharedApplication].keyWindow];
    CGFloat yMax = rect.origin.y + rect.size.height;
    if ([UIScreen mainScreen].bounds.size.height - yMax < hKeyboard) {
        CGFloat hMove = hKeyboard- ([UIScreen mainScreen].bounds.size.height - yMax);
//        CGFloat hTemp = hMove -_moveY;
        self.tp_moveY += hMove;
        
        // 将视图控制器视图上的控件整体上移
        for (UIView *tempView in self.view.subviews) {
            CGRect rect = tempView.frame;
            rect.origin.y -= hMove;
            tempView.frame = rect;
        }
    }
}

// 键盘隐藏时：对话视图整体还原（即所有的子视图都下移）
- (void)tp_keyboardWillDisappear:(NSNotification *)sender {
    for (UIView *tempView in self.view.subviews) {
        CGRect rect = tempView.frame;
        rect.origin.y += self.tp_moveY;
        tempView.frame = rect;
    }
    self.tp_moveY = 0;
}

#pragma mark - Getters & Setters

- (void)setTp_moveY:(CGFloat)tp_moveY {
    [self willChangeValueForKey:@"tp_moveY"];
    objc_setAssociatedObject(self, kMoveY, @(tp_moveY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"tp_moveY"];
}

- (CGFloat)tp_moveY {
    return [objc_getAssociatedObject(self, kMoveY) doubleValue];
}

- (void)setTp_isOpenObserveKeyboard:(BOOL)tp_isOpenObserveKeyboard {
    [self willChangeValueForKey:@"tp_isOpenObserveKeyboard"];
    objc_setAssociatedObject(self, kIsOpenObserveKeyboard, @(tp_isOpenObserveKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"tp_isOpenObserveKeyboard"];
}

- (BOOL)tp_isOpenObserveKeyboard {
    return [objc_getAssociatedObject(self, kIsOpenObserveKeyboard) boolValue];
}

@end
