//
//  UIImage+Thumbnail.h
//
//  Created by Santiago Gonzalez on 4/30/11.
//

#import <Foundation/Foundation.h>


@interface UIImage (UIImage_Thumbnail)

- (UIImage *)thumbnail;
- (UIImage *)thumbnailWithWidth:(int)twidth height:(int)theight;

@end
