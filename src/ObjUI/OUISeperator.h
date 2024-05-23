#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUISeperator : OUIControl

+ (instancetype)horizontalSeperator;
+ (instancetype)verticalSeperator;

- (instancetype)initWithVerticalOrientation: (bool)vertical;

@end

#pragma clang assume_nonnull end
