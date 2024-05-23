#include "OUILabel.h"

@implementation OUILabel

+ (instancetype)labelWithText:(OFString *)text
{ return [[self alloc] initWithText:text]; }

- (instancetype)initWithText:(OFString *)text
{
    self = [super init];

    _control = uiControl(uiNewLabel(text.UTF8String));

    return self;
}

- (instancetype)initFromControl:(uiControl *)control
{
    uiLabel *label = uiLabel(control);
    self = [super initFromControl: control];

    _text = [OFString stringWithUTF8String: uiLabelText(label)];

    return self;
}

- (void)setText:(OFString *)text
{
    uiLabelSetText(uiLabel(_control), text.UTF8String);
    _text = text;
}


@end
