//
//  UIAlertController+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/5.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIAlertController+TPAddition.h"

@implementation UIAlertController (TPAddition)

+ (UIAlertController *)tp_alertViewWithTitle:(NSString *)title
                                     message:(NSString *)message
                                     actions:(NSArray<NSString *> *)actions
                                     handler:(void (^)(NSUInteger idx))handler {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    for (int idx = 0; idx < actions.count; idx ++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actions[idx]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           
                                                           if (handler) {
                                                               handler(idx);
                                                           }
                                                           
                                                       }];
        [ac addAction:action];
    }
    
    return ac;
}

+ (UIAlertController *)tp_actionSheetWithTitle:(NSString *)title
                                       message:(NSString *)message
                                       actions:(NSArray<NSString *> *)actions
                                        cancel:(NSString *)cancel
                                  cancelHandle:(dispatch_block_t)cancelHandler
                                       handler:(void (^)(NSUInteger idx))handler {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int idx = 0; idx < actions.count; idx ++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actions[idx]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           
                                                           if (handler) {
                                                               handler(idx);
                                                           }
                                                           
                                                       }];
        [ac addAction:action];
    }
    
    if (cancel) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancel
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           
                                                           if (cancelHandler) {
                                                               cancelHandler();
                                                           }
                                                           
                                                       }];
        [ac addAction:action];
    }
    
    return ac;
}

@end
