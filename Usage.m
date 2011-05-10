#import "UIImage+Thumbnail.h"
#import "UIImage+Alpha.h"
#import "UIImage+RoundedCorner.h"


//Image that will be disected! :-)
UIImage *prettyImage = [UIImage imageNamed:@"MyImage.png"];

//Create a 100x100 thumbnail of it
UIImage *thumbnailOfImage = [prettyImage thumbnail];

//Create a 250x250 thumbnail of it
UIImage *sizedThumbnailOfImage = [prettyImage thumbnailWithWidth:250 height:250];

//Check if an image has alpha
if ([prettyImage hasAlpha]) {
	//Do something cool here!
}

//Create an image with rounded corners
UIImage *roundedImage = [prettyImage roundedCornerImage:30 borderSize:0];