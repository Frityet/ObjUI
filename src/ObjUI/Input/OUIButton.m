#include "OUIButton.h"

@implementation OUIButton

+ (instancetype)buttonWithLabel:(OFString *)text
{ return [[self alloc] initWithText:text]; }

- (instancetype)initWithText:(OFString *)text
{
    return [super initFromControl: uiControl(uiNewButton(text.UTF8String)) onChangedSetter: uiButtonOnClicked];
}

- (OFString *)text
{
    return [OFString stringWithUTF8String: uiButtonText(uiButton(_control))];
}

- (void)setText:(OFString *)text
{
    uiButtonSetText(uiButton(_control), text.UTF8String);
}

@end
