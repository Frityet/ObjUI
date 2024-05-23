#include "OUICheckbox.h"

@implementation OUICheckbox

+ (instancetype)checkboxWithLabel: (OFString *)text
{ return [[self alloc] initWithLabel: text]; }

- (instancetype)initWithLabel: (OFString *)text
{
    return [super initFromControl: uiControl(uiNewCheckbox(text.UTF8String)) onChangedSetter: uiCheckboxOnToggled];
}


- (OFString *)text
{
    return [OFString stringWithUTF8String: uiCheckboxText(uiCheckbox(_control))];
}

- (void)setText: (OFString *)text
{
    uiCheckboxSetText(uiCheckbox(_control), text.UTF8String);
}

- (bool)checked
{
    return uiCheckboxChecked(uiCheckbox(_control));
}

- (void)setChecked: (bool)checked
{
    uiCheckboxSetChecked(uiCheckbox(_control), checked);
}

@end
