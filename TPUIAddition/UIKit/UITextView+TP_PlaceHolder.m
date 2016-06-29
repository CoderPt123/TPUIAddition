//
//  UITextView+TP_PlaceHolder.m
//  TPUIAddition
//
//  Created by TP on 16/6/28.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UITextView+TP_PlaceHolder.h"
#import <Objc/runtime.h>

static void *kTP_PlaceHolderLabel = @"kTP_PlaceHolderLabel";
static void *kTP_PlaceHolderTopConstraint = @"kTP_PlaceHolderTopConstraint";

@interface UITextView ()

@property (nonatomic, weak) UILabel *tp_placeHolderLabel;
@property (nonatomic, strong) NSLayoutConstraint *tp_placeHolderTopConstraint;

@end

@implementation UITextView (TP_PlaceHolder)

@dynamic tp_placeHolder, tp_placeHolderAttributedText, tp_placeHolderFont, tp_placeHolderColor;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(setText:);
        SEL swizzledSelector = @selector(tp_setText:);
        
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

- (void)tp_setText:(NSString *)text {
    [self tp_setText:text];
    [self tp_changeEdit];
}

- (void)dealloc {
    if (self.tp_placeHolderLabel) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (void)tp_changeEdit {
    if (self.tp_placeHolderLabel) {
        self.tp_placeHolderLabel.hidden = self.text.length > 0;
    }
}

#pragma mark - Getters & Setters

- (void)setTp_placeHolderOffsetY:(CGFloat)placeHolderOffsetY {
    if (self.tp_placeHolderLabel) {
        self.tp_placeHolderTopConstraint.constant = placeHolderOffsetY;
    }
}

- (CGFloat)tp_placeHolderOffsetY {
    if (self.tp_placeHolderLabel) {
        return self.tp_placeHolderTopConstraint.constant;
    }
    return 0;
}

- (void)setTp_placeHolderColor:(UIColor *)placeHolderColor {
    self.tp_placeHolderLabel.textColor = placeHolderColor;
}

- (UIColor *)tp_placeHolderColor {
    return self.tp_placeHolderLabel.textColor;
}

- (void)setTp_placeHolderFont:(UIFont *)placeHolderFont {
    self.tp_placeHolderLabel.font = placeHolderFont;
}

- (UIFont *)tp_placeHolderFont {
    return self.tp_placeHolderLabel.font;
}

- (void)setTp_placeHolderAttributedText:(NSAttributedString *)placeHolderAttributedText {
    self.tp_placeHolderLabel.attributedText = placeHolderAttributedText;
}

- (NSAttributedString *)tp_placeHolderAttributedText {
    return self.tp_placeHolderLabel.attributedText;
}

- (void)setTp_placeHolder:(NSString *)placeHolder {
    self.tp_placeHolderLabel.text = placeHolder;
}

- (NSString *)tp_placeHolder {
    return self.tp_placeHolderLabel.text;
}

- (void)setTp_placeHolderTopConstraint:(NSLayoutConstraint *)placeHolderTopConstraint {
    [self willChangeValueForKey:@"tp_placeHolderTopConstraint"];
    objc_setAssociatedObject(self, kTP_PlaceHolderTopConstraint, placeHolderTopConstraint, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_placeHolderTopConstraint"];
}

- (NSLayoutConstraint *)tp_placeHolderTopConstraint {
    return objc_getAssociatedObject(self, kTP_PlaceHolderTopConstraint);
}

- (void)setTp_placeHolderLabel:(UILabel *)placeHolderLabel {
    [self willChangeValueForKey:@"tp_placeHolderLabel"];
    objc_setAssociatedObject(self, kTP_PlaceHolderLabel, placeHolderLabel, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"tp_placeHolderLabel"];
}

- (UILabel *)tp_placeHolderLabel {
    if (!objc_getAssociatedObject(self, &kTP_PlaceHolderLabel)) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
        lab.backgroundColor = [UIColor clearColor];
        lab.textColor = [UIColor grayColor];
        lab.numberOfLines = 0;
        lab.textAlignment = NSTextAlignmentLeft;
        lab.lineBreakMode = NSLineBreakByWordWrapping;
        lab.font = [UIFont systemFontOfSize:14];
        
        if (self.text.length) {
            lab.hidden = YES;
        }
        
        lab.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:lab];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-5]];
        
        // 添加监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tp_changeEdit) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tp_changeEdit) name:UITextViewTextDidEndEditingNotification object:nil];
        
        self.tp_placeHolderLabel = lab;
    }
    
    return objc_getAssociatedObject(self, kTP_PlaceHolderLabel);
}

@end
