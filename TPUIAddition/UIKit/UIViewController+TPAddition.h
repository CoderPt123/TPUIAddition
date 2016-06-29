//
//  UIViewController+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/4/14.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TP_Alert)

- (void)tp_showAlertWithMessage:(NSString *)message;
- (void)tp_showAlertWithMessage:(NSString *)message title:(NSString *)title;

@end


@protocol TPViewControllerCompletionDelegate <NSObject>

- (void)tp_viewController:(UIViewController *)viewController completion:(id)info;

@end

@interface UIViewController (TP_Completion)

@property (nonatomic, assign) id tp_identifie;
@property (nonatomic, assign) id<TPViewControllerCompletionDelegate> tp_completeDelegate;
@property (nonatomic, copy) void (^tp_completeBlock)(id info);

@end
