//
//  UIAlertController+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (TPAddition)

/**
 *  alertView的快捷创建方式
 *
 *  @param title   标题
 *  @param message 提示消息
 *  @param actions 事件数组：存入事件名
 *  @param handler 事件的Block回调：idx参数对应 actions（事件数组）的下标
 *
 *  @return UIAlertController
 */
+ (UIAlertController *)tp_alertViewWithTitle:(NSString *)title
                                     message:(NSString *)message
                                     actions:(NSArray<NSString *> *)actions
                                     handler:(void (^)(NSUInteger idx))handler;

/**
 *  actionSheet的快捷创建方式
 *
 *  @param title         标题
 *  @param message       提示消息
 *  @param actions       事件数组：存入事件名
 *  @param cancel        cancel事件的事件名
 *  @param cancelHandler cancel事件的Block回调
 *  @param handler       事件的Block回调：idx参数对应 actions（事件数组）的下标
 *
 *  @return UIAlertController
 */
+ (UIAlertController *)tp_actionSheetWithTitle:(NSString *)title
                                       message:(NSString *)message
                                       actions:(NSArray<NSString *> *)actions
                                        cancel:(NSString *)cancel
                                  cancelHandle:(dispatch_block_t)cancelHandler
                                       handler:(void (^)(NSUInteger idx))handler;

@end
