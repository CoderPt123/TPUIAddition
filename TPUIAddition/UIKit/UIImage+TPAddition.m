//
//  UIImage+TPAddition.m
//  TPUIAddition
//
//  Created by PengTao on 16/1/18.
//  Copyright © 2016年 CoderTPeng. All rights reserved.
//

#import "UIImage+TPAddition.h"

@implementation UIImage (TPAddition)

- (UIImage *)tp_imageMakedWithColor:(UIColor *)maskColor {
    NSParameterAssert(maskColor != nil);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextScaleCTM(context, 1.0f, -1.0f);
        CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
        
        CGContextClipToMask(context, imageRect, self.CGImage);
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        CGContextFillRect(context, imageRect);
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (UIImage *)tp_cropToRect:(CGRect)rect {
    CGImageRef imageRef   = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return croppedImage;
}

// 对图片尺寸进行压缩
- (UIImage *)tp_imageScaledToSize:(CGSize)newSize {
    // 使用新的尺寸，创建一个新的图形编辑环境
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // 将旧图片放入新的图形编辑环境中进行绘制
    // Tell the old image to draw in this new context, with the desired new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // 从新的图形编辑环境中得到新图片
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束图形编辑环境
    // End the context
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 压缩图片为预设大小，并转为JPG格式
- (NSData *)tp_compressedToJPGDataForMaxSize:(NSUInteger)size {
    UIImage *image = self.copy;
    double compress = 1;
    NSData *imgData = UIImageJPEGRepresentation(image, compress);
    CGFloat length = imgData.length/1024;
    while (length > size) {
        compress -= 0.05;
        imgData = UIImageJPEGRepresentation(image, compress);
        length = imgData.length/1024;
    }
    
    return imgData;
}

- (UIImage *)tp_compressedToJPGImageForMaxSize:(NSUInteger)size {
    return [UIImage imageWithData:[self tp_compressedToJPGDataForMaxSize:size]];
}

@end
