#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

@interface OUISpinbox : OUIControl<OUIInput>

@property(nonatomic, setter=setValue:) int value;

+ (instancetype)spinbox;
+ (instancetype)spinboxWithMin: (int)min max: (int)max;
- (instancetype)initWithMin: (int)min max: (int)max;

@end


