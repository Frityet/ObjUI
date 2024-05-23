#include "OUILabel.h"

@implementation OUILabel

+ (instancetype)labelWithText:(OFString *)text
{ return [[self alloc] initWithText:text]; }

- (instancetype)initWithText:(OFString *)text
{ return [super initFromControl: uiControl(uiNewLabel(text.UTF8String))]; }

- (OFString *)text
{
    return [OFString stringWithUTF8String: uiLabelText(uiLabel(_control))];
}

- (void)setText:(OFString *)text
{
    uiLabelSetText(uiLabel(_control), text.UTF8String);
}

@end
