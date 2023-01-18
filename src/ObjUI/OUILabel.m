#include "OUILabel.h"

@implementation OUILabel

+ (instancetype)labelWithText:(OFString *)text
{ return [[self alloc] initWithText:text]; }

- (instancetype)initWithText:(OFString *)text
{

    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewLabel(text.UTF8String));

    return self;
}

- (void)setText:(OFString *)text
{
    uiLabelSetText(uiLabel(_control), text.UTF8String);
    _text = text;
}


@end
