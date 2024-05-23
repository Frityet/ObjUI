#include "OUIColourButton.h"
@implementation OUIColourButton

+ (instancetype)button
{ return [[self alloc] init];}

- (instancetype)init
{ return [super initFromControl: uiControl(uiNewColorButton()) onChangedSetter: uiColorButtonOnChanged]; }

- (void)setColour: (OUIColour)colour
{ uiColorButtonSetColor(uiColorButton(_control), colour.red, colour.green, colour.blue, colour.alpha); }

- (OUIColour)colour
{
    double red, green, blue, alpha;
    uiColorButtonColor(uiColorButton(_control), &red, &green, &blue, &alpha);
    return (OUIColour){red, green, blue, alpha};
}

@end
