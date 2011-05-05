#import "UIImage+Thumbnail.h"


//Create some random image and then make a 100x100 thumbnail of it
UIImage *prettyImage = [UIImage imageNamed:@"MyImage.png"];
UIImage *thumbnailOfImage = [prettyImage thumbnail];

//Create some random image and then make a 250x250 thumbnail of it
UIImage *prettyImage2 = [UIImage imageNamed:@"MyOtherImage.png"];
UIImage *thumbnailOfImage2 = [prettyImage thumbnailWithWidth:250 height:250];