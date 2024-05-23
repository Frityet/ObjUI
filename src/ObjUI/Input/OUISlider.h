#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>
#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUISlider : OUIInput

@property int value;

+ (instancetype)slider;
+ (instancetype)sliderWithMin: (int)min max: (int)max;
- (instancetype)initWithMin: (int)min max: (int)max;

@end

#pragma clang assume_nonnull end
