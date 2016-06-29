//
//  UIWindow+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/2/17.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (TP_Alert)

- (void)tp_showAlertWithMessage:(NSString *)message;
- (void)tp_showAlertWithMessage:(NSString *)message title:(NSString *)title;

@end
