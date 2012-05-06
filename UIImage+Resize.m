//
//  UIImage+Resize.m
//
//  Copyright 2011 Hicaduda. All rights reserved.
//
/*
 
 hicaduda.com || http://github.com/sgonzalez/UIImage-Categories
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software in binary form, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "UIImage+Resize.h"


@implementation UIImage (UIImage_Resize)

- (UIImage *)scaleProportionallyToSize:(CGSize)targetSize {
	
	UIImage *sourceImage = self;
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (!CGSizeEqualToSize(imageSize, targetSize)) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor < heightFactor) 
			scaleFactor = widthFactor;
        else
			scaleFactor = heightFactor;
		
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
		
        // center the image
        if (widthFactor < heightFactor) {
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
        } else if (widthFactor > heightFactor) {
			thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
	}
	
	UIGraphicsBeginImageContext(targetSize);
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	if(newImage == nil) NSLog(@"could not scale image");
	
	return newImage;
}

- (UIImage *)croppedImage:(CGRect)bounds {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], bounds);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

- (UIImage *)thumbnailWithWidth:(int)twidth height:(int)theight {
	CGImageRef tmp = self.CGImage;
	
    CGColorSpaceRef colorspace = CGImageGetColorSpace(tmp);
    
    CGContextRef context = CGBitmapContextCreate(NULL, twidth, theight, CGImageGetBitsPerComponent(tmp), CGImageGetBytesPerRow(tmp)/CGImageGetWidth(tmp)*theight, colorspace, CGImageGetAlphaInfo(tmp));
    
    if(context == NULL)
        return self;
    
    
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), tmp);
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
	CGContextRelease(context);
    
    return [UIImage imageWithCGImage:imgRef];
}

- (UIImage *)thumbnail {
    CGImageRef tmp = self.CGImage;

    CGColorSpaceRef colorspace = CGImageGetColorSpace(tmp);
    
    CGContextRef context = CGBitmapContextCreate(NULL, 100, 100, CGImageGetBitsPerComponent(tmp), CGImageGetBytesPerRow(tmp)/CGImageGetWidth(tmp)*100, colorspace, CGImageGetAlphaInfo(tmp));
    
    if(context == NULL)
        return self;
	
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), tmp);
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    return [UIImage imageWithCGImage:imgRef];
}

@end
