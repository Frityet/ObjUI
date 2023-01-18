#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUISeperator : OUIControl

+ (instancetype)horizontalSeperator;
+ (instancetype)verticalSeperator;

- (instancetype)initWithOrientation: (bool)vertical;

@end
