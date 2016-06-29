//
//  UIImage+TPAddition.h
//  TPUIAddition
//
//  Created by PengTao on 16/1/18.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TPIMG(...) [UIImage imageNamed:__VA_ARGS__]

@interface UIImage (TPAddition)

- (UIImage *)tp_imageMakedWithColor:(UIColor *)maskColor;
- (UIImage *)tp_cropToRect:(CGRect)rect;

/** 压缩图片 */
- (UIImage *)tp_imageScaledToSize:(CGSize)newSize;

/** 压缩图片为预设大小，并转为JPG格式二进制数据 */
- (NSData *)tp_compressedToJPGDataForMaxSize:(NSUInteger)size;

/** 压缩图片为预设大小，并转为JPG格式 */
- (UIImage *)tp_compressedToJPGImageForMaxSize:(NSUInteger)size;

@end
