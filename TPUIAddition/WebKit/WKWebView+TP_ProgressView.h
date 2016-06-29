//
//  WKWebView+TP_ProgressView.h
//  TPUIAddition
//
//  Created by PengTao on 16/5/27.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (TP_ProgressView)

/* 是否开启进度条：必须先设为为YES才能开启进度条 */
@property (nonatomic, assign) BOOL tp_showProgressView;
@property (nonatomic, readonly) UIProgressView *tp_progressView;// 默认为橙色，置顶，高2像素
@property (nonatomic, assign) CGFloat tp_heightOfProgressView;  // 默认高2像素
@property (nonatomic, assign) CGFloat tp_offsetYOfProgressView; // 默认置顶(即偏移量为0)

@property (nonatomic, assign) BOOL tp_networkActivityIndicatorVisible;

@end
