//
//  UIImage + Thumbnail.m
//  The Monkey Business
//
//  Created by Charlie Fish on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIImage + Thumbnail.h"


@implementation UIImage (UIImage___Thumbnail)

- (UIImage *)thumbnail {
    CGImageRef tmp = self.CGImage;

    CGColorSpaceRef colorspace = CGImageGetColorSpace(tmp);
    
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 240, // Changed this
                                                 160, // Changed this
                                                 CGImageGetBitsPerComponent(tmp),
                                                 CGImageGetBytesPerRow(tmp)/CGImageGetWidth(tmp)*160, // Changed this
                                                 colorspace,
                                                 CGImageGetAlphaInfo(tmp));
    
    if(context == NULL)
        return nil;
    
    // Removed clipping code
    
    // draw image to context
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), tmp);
    
    // extract resulting image from context
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    return [UIImage imageWithCGImage:imgRef];
}

@end
