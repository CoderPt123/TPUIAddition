//
//  UIImageView+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/2/4.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIImageView+TPAddition.h"

@implementation UIImageView (TPAddition)

+ (instancetype)imageViewWithFrame:(CGRect)frame image:(UIImage *)image {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    if (image) {
        imageView.image = image;
    }
    
    imageView.userInteractionEnabled = YES;
    
    return imageView;
}

@end
