//
//  WKWebView+TP_ProgressView.m
//  TPUIAddition
//
//  Created by PengTao on 16/5/27.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "WKWebView+TP_ProgressView.h"
#import <objc/runtime.h>

static void *kTP_observer = @"kTP_observer";
static void *kTP_progressView = @"kTP_progressView";
static void *kTP_showProgressView = @"kTP_showProgressView";
static void *kTP_heightConstraintOfProgressView = @"kTP_heightConstraintOfProgressView";
static void *kTP_topConstraintOfProgressView = @"kTP_topConstraintOfProgressView";
static void *kTP_networkActivityIndicatorVisible = @"kTP_networkActivityIndicatorVisible";

#pragma mark - ObserverOfWKWebView_ProgressView

/** WKWebView的观察者 */
@interface TPObserverOfWKWebView_ProgressView : NSObject

@property (nonatomic, weak) WKWebView *webView;

@end

@implementation TPObserverOfWKWebView_ProgressView

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"WKWebView进度条、加载状态观察者被销毁");
#endif
}

// 计算进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.webView.tp_progressView.hidden = YES;
            [self.webView.tp_progressView setProgress:0 animated:NO];
        } else {
            self.webView.tp_progressView.hidden = NO;
            [self.webView.tp_progressView setProgress:newprogress animated:YES];
        }
    } else if (object == self.webView && [keyPath isEqualToString:@"loading"]) {
        BOOL isLoading = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = isLoading;
    }
}

@end

#pragma mark - WKWebView

@interface WKWebView ()

@property (nonatomic, strong) TPObserverOfWKWebView_ProgressView *tp_observer;

@property (nonatomic, strong, readwrite) UIProgressView *tp_progressView;
@property (nonatomic, strong) NSLayoutConstraint *tp_heightConstraintOfProgressView;
@property (nonatomic, strong) NSLayoutConstraint *tp_topConstraintOfProgressView;

@end

@implementation WKWebView (TP_ProgressView)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = NSSelectorFromString(@"dealloc");
        SEL swizzledSelector = @selector(tp_deallocSwizzle);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(aClass,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(aClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - 不移除观察者有可能导致内存泄露

// 销毁前先注销观察者
- (void)tp_deallocSwizzle {
    if (self.tp_observer) {
        if (self.tp_showProgressView) {
            [self removeObserver:self.tp_observer forKeyPath:@"estimatedProgress"];
        }
        if (self.tp_networkActivityIndicatorVisible) {
            [self removeObserver:self.tp_observer forKeyPath:@"loading"];
        }
    }
    [self tp_deallocSwizzle];
}

#pragma mark - 观测者

- (void)setTp_observer:(TPObserverOfWKWebView_ProgressView *)tp_observer {
    [self willChangeValueForKey:@"tp_observer"]; // KVO
    objc_setAssociatedObject(self, kTP_observer, tp_observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"tp_observer"];  // KVO
}

- (TPObserverOfWKWebView_ProgressView *)tp_observer {
    return objc_getAssociatedObject(self, kTP_observer);
}

- (void)tp_createObserver {
    if (!self.tp_observer) {
        TPObserverOfWKWebView_ProgressView *observer = [[TPObserverOfWKWebView_ProgressView alloc] init];
        self.tp_observer = observer;
        observer.webView = self;
    }
}

- (void)tp_closeObserver {
    BOOL isClose = YES;
    
    if (self.tp_observer) {
        if (!self.tp_showProgressView) {
            
            [self removeObserver:self.tp_observer forKeyPath:@"estimatedProgress"];
            [self.tp_progressView removeFromSuperview];
            self.tp_progressView = nil;
            
        } else {
            isClose = NO;
        }
        
        if (!self.tp_networkActivityIndicatorVisible) {
            
            [self removeObserver:self.tp_observer forKeyPath:@"loading"];
            
        } else {
            isClose = NO;
        }
        
        if (isClose) {
            self.tp_observer = nil;
        }
    }
}

#pragma mark - 进度条

- (void)tp_createProgressView {
    [self tp_createObserver];
    
    // 添加进度条
    UIProgressView *progressView = [[UIProgressView alloc] init];
    progressView.tintColor = [UIColor orangeColor];
    progressView.trackTintColor = [UIColor whiteColor];
    
    self.tp_progressView = progressView;
    [self addSubview:progressView];
    
    // 添加约束
    progressView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    [self addConstraints:@[constraintTop, constraintLeft, constraintRight]];
    
    NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:2];
    
    [progressView addConstraint:constraintHeight];
    
    self.tp_topConstraintOfProgressView = constraintTop;
    self.tp_heightConstraintOfProgressView = constraintHeight;
    
    [self addObserver:self.tp_observer forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

// 进度条
- (void)setTp_progressView:(UIProgressView *)tp_progressView {
    [self willChangeValueForKey:@"tp_progressView"]; // KVO
    objc_setAssociatedObject(self, kTP_progressView, tp_progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"tp_progressView"]; // KVO
}

- (UIProgressView *)tp_progressView {
    return objc_getAssociatedObject(self, kTP_progressView);
}

// 是否显示进度条
- (void)setTp_showProgressView:(BOOL)tp_showProgressView {
    BOOL preIsShow = self.tp_showProgressView;
    
    [self willChangeValueForKey:@"tp_showProgressView"]; // KVO
    objc_setAssociatedObject(self, kTP_showProgressView, @(tp_showProgressView), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_showProgressView"];  // KVO
    
    if (tp_showProgressView) {
        if (!preIsShow) {
            [self tp_createProgressView];
        }
    } else {
        if (preIsShow) {
            [self tp_closeObserver];
        }
    }
}

- (BOOL)tp_showProgressView {
    return [objc_getAssociatedObject(self, kTP_showProgressView) boolValue];
}

// 进度条高度
- (void)setTp_heightConstraintOfProgressView:(NSLayoutConstraint *)tp_heightConstraintOfProgressView {
    [self willChangeValueForKey:@"tp_heightConstraintOfProgressView"]; // KVO
    objc_setAssociatedObject(self, kTP_heightConstraintOfProgressView, tp_heightConstraintOfProgressView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_heightConstraintOfProgressView"];  // KVO
}

- (NSLayoutConstraint *)tp_heightConstraintOfProgressView {
    return objc_getAssociatedObject(self, kTP_heightConstraintOfProgressView);
}

- (void)setTp_heightOfProgressView:(CGFloat)tp_heightOfProgressView {
    self.tp_heightConstraintOfProgressView.constant = tp_heightOfProgressView;
}

- (CGFloat)tp_heightOfProgressView {
    return self.tp_heightConstraintOfProgressView.constant;
}

// 进度条上下偏移量
- (void)setTp_topConstraintOfProgressView:(NSLayoutConstraint *)tp_topConstraintOfProgressView {
    [self willChangeValueForKey:@"tp_topConstraintOfProgressView"]; // KVO
    objc_setAssociatedObject(self, kTP_topConstraintOfProgressView, tp_topConstraintOfProgressView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_topConstraintOfProgressView"];  // KVO
}

- (NSLayoutConstraint *)tp_topConstraintOfProgressView {
    return objc_getAssociatedObject(self, kTP_topConstraintOfProgressView);
}

- (void)setTp_offsetYOfProgressView:(CGFloat)tp_offsetYOfProgressView {
    self.tp_topConstraintOfProgressView.constant = tp_offsetYOfProgressView;
}

- (CGFloat)tp_offsetYOfProgressView {
    return self.tp_topConstraintOfProgressView.constant;
}

#pragma mark - 状态栏网络指示器

// 创建加载状态观察者
- (void)tp_addObserveOfLoading {
    [self tp_createObserver];
    
    [self addObserver:self.tp_observer forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
}

// 状态栏网络指示器
- (void)setTp_networkActivityIndicatorVisible:(BOOL)tp_networkActivityIndicatorVisible {
    BOOL preIsShow = self.tp_networkActivityIndicatorVisible;
    [self willChangeValueForKey:@"tp_networkActivityIndicatorVisible"]; // KVO
    objc_setAssociatedObject(self, kTP_networkActivityIndicatorVisible, @(tp_networkActivityIndicatorVisible), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_networkActivityIndicatorVisible"];  // KVO
    
    if (tp_networkActivityIndicatorVisible) {
        if (!preIsShow) {
            [self tp_addObserveOfLoading];
        }
    } else {
        if (preIsShow) {
            [self tp_closeObserver];
        }
    }
}

- (BOOL)tp_networkActivityIndicatorVisible {
    return [objc_getAssociatedObject(self, kTP_networkActivityIndicatorVisible) boolValue];
}

@end
