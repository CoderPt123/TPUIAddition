//
//  UIWindow+TPUIKitAdditionLibrary.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/17.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIWindow+TPAddition.h"
#import "UIAlertController+TPAddition.h"

@implementation UIWindow (TP_Alert)

- (void)tp_showAlertWithMessage:(NSString *)message {
    [self tp_showAlertWithMessage:message title:nil];
}

- (void)tp_showAlertWithMessage:(NSString *)message title:(NSString *)title {
    UIAlertController *ac = [UIAlertController tp_alertViewWithTitle:title message:message actions:@[@"确定"] handler:nil];
    [self.rootViewController presentViewController:ac animated:YES completion:nil];
}

@end
