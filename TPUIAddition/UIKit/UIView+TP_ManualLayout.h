//
//  UIView+TP_ManualLayout.h
//  TPUIAddition
//
//  Created by PengTao on 16/3/28.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//
//  copy from HandyFrame, Thanks casa.

#import <UIKit/UIKit.h>

#define TPSIZE_I6(...) (__VA_ARGS__)*([UIScreen mainScreen].bounds.size.width)/375

#define TPSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define TPSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define TPSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define TPSCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)

typedef NS_ENUM(NSInteger, TPUIScreenType) {
    TPUIScreenType_iPhone6 = 375,
    TPUIScreenType_iPhone6P = 360,
};

@interface UIView (TP_ManualLayout)

// coordinator getters
- (CGPoint)origin;
- (CGFloat)x;
- (CGFloat)y;
- (CGSize)size;
- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)centerX;
- (CGFloat)centerY;

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setLeft:(CGFloat)left;
- (void)setY:(CGFloat)y;
- (void)setTop:(CGFloat)top;

// height
- (void)setHeight:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setWidth:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;

// center
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;

- (void)topRatio:(CGFloat)top FromView:(UIView *)view screenType:(TPUIScreenType)screenType;
- (void)bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(TPUIScreenType)screenType;
- (void)leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(TPUIScreenType)screenType;
- (void)rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(TPUIScreenType)screenType;

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(TPUIScreenType)screenType;
- (void)bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(TPUIScreenType)screenType;
- (void)leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(TPUIScreenType)screenType;
- (void)rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(TPUIScreenType)screenType;

- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;

// size
- (void)setSize:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;

- (UIView *)topSuperView;

@end

@protocol LayoutProtocol
@required
// put your layout code here
- (void)calculateLayout;
@end
