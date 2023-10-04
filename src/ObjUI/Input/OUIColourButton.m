#include "OUIColourButton.h"

static void onChangedWrapper(uiColorButton *button, void *data)
{
    OUIColourButton *self = (__bridge OUIColourButton *)data;
    self.onChanged(self);
}

@implementation OUIColourButton

@synthesize onChanged;

+ (instancetype)colourButton
{ return [[self alloc] init];}

- (instancetype)init
{
    if (!(self = [super init])) return nil;
    _control = uiControl(uiNewColorButton());
    uiColorButtonOnChanged(uiColorButton(_control), onChangedWrapper, (__bridge_retained void *)self);
    return self;
}

- (void)setColour: (OUIColour)colour
{ uiColorButtonSetColor(uiColorButton(_control), colour.red, colour.green, colour.blue, colour.alpha); }

- (OUIColour)getColour
{
    double red, green, blue, alpha;
    uiColorButtonColor(uiColorButton(_control), &red, &green, &blue, &alpha);
    return (OUIColour){red, green, blue, alpha};
}

@end
