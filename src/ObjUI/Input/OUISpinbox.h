#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>
#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUISpinbox : OUIInput

@property int value;

+ (instancetype)spinbox;
+ (instancetype)spinboxWithMin: (int)min max: (int)max;
- (instancetype)initWithMin: (int)min max: (int)max;

@end

#pragma clang assume_nonnull end
