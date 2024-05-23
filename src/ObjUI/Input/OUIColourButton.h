#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

typedef struct {
    double red, green, blue, alpha;
} OUIColour;

@interface OUIColourButton : OUIInput

@property OUIColour colour;

+ (instancetype)button;

@end
