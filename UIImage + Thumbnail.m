//
//  UIImage+Thumbnail.m
//
//  Created by Santiago Gonzalez on 4/30/11.
//

#import "UIImage+Thumbnail.h"


@implementation UIImage (UIImage_Thumbnail)

- (UIImage *)thumbnailWithWidth:(int)twidth height:(int)theight {
	CGImageRef tmp = self.CGImage;
	
    CGColorSpaceRef colorspace = CGImageGetColorSpace(tmp);
    
    CGContextRef context = CGBitmapContextCreate(NULL, twidth, theight, CGImageGetBitsPerComponent(tmp), CGImageGetBytesPerRow(tmp)/CGImageGetWidth(tmp)*160, colorspace, CGImageGetAlphaInfo(tmp));
    
    if(context == NULL)
        return self;
    
    
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), tmp);
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    return [UIImage imageWithCGImage:imgRef];
}

- (UIImage *)thumbnail {
    CGImageRef tmp = self.CGImage;

    CGColorSpaceRef colorspace = CGImageGetColorSpace(tmp);
    
    CGContextRef context = CGBitmapContextCreate(NULL, 240, 160, CGImageGetBitsPerComponent(tmp), CGImageGetBytesPerRow(tmp)/CGImageGetWidth(tmp)*160, colorspace, CGImageGetAlphaInfo(tmp));
    
    if(context == NULL)
        return self;
	
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), tmp);
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    return [UIImage imageWithCGImage:imgRef];
}

@end
