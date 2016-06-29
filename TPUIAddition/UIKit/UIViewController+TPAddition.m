//
//  UIViewController+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/4/14.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIViewController+TPAddition.h"
#import <objc/runtime.h>
#import "UIAlertController+TPAddition.h"

static void *kTP_CompleteDelegate = @"kCompleteDelegate";
static void *kTP_Identifie = @"kIdentifie";
static void *kTP_CompleteBlock = @"kTP_CompleteBlock";

@implementation UIViewController (TP_Alert)

- (void)tp_showAlertWithMessage:(NSString *)message {
    [self tp_showAlertWithMessage:message title:nil];
}

- (void)tp_showAlertWithMessage:(NSString *)message title:(NSString *)title {
    UIAlertController *ac = [UIAlertController tp_alertViewWithTitle:title message:message actions:@[@"确定"] handler:nil];
    [self presentViewController:ac animated:YES completion:nil];
}

@end

@implementation UIViewController (TP_Completion)

- (id<TPViewControllerCompletionDelegate>)tp_completeDelegate {
    return objc_getAssociatedObject(self, kTP_CompleteDelegate);
}

- (void)setTp_completeDelegate:(id<TPViewControllerCompletionDelegate>)tp_completeDelegate {
    [self willChangeValueForKey:@"tp_completeDelegate"];
    objc_setAssociatedObject(self, kTP_CompleteDelegate, tp_completeDelegate, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_completeDelegate"];
}

- (id)tp_identifie {
    return objc_getAssociatedObject(self, kTP_Identifie);
}

- (void)setTp_identifie:(id)tp_identifie {
    [self willChangeValueForKey:@"tp_identifie"];
    objc_setAssociatedObject(self, kTP_Identifie, tp_identifie, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_identifie"];
}

- (void (^)(id))tp_completeBlock {
    return objc_getAssociatedObject(self, kTP_CompleteBlock);
}

- (void)setTp_completeBlock:(void (^)(id))tp_completeBlock {
    [self willChangeValueForKey:@"tp_completeBlock"];
    objc_setAssociatedObject(self, kTP_CompleteBlock, tp_completeBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"tp_completeBlock"];
}

@end
