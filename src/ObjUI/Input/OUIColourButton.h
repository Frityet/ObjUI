#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

typedef struct {
    double red, green, blue, alpha;
} OUIColour;

@interface OUIColourButton : OUIControl<OUIInput>

@property (nonatomic, setter=setColour:, getter=getColour) OUIColour colour;

+ (instancetype)colourButton;

@end
