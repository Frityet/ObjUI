#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

typedef struct {
    double red, green, blue, alpha;
} OUIColour;

@interface OUIColourButton : OUIInput

@property OUIColour colour;

+ (instancetype)button;

@end

#pragma clang assume_nonnull end
