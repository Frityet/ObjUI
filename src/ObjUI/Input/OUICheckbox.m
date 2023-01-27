#include "OUICheckbox.h"

static void onToggledWrapper(uiCheckbox *checkbox, void *data)
{
    OUICheckbox *self = (__bridge OUICheckbox *)data;
    self.onChanged(self);
}

@implementation OUICheckbox

@synthesize onChanged;

+ (instancetype)checkboxWithLabel: (OFString *)text
{ return [[self alloc] initWithLabel: text]; }

- (instancetype)initWithLabel: (OFString *)text
{
    self = [super init];
    if (self == nil) return nil;

    _control = uiControl(uiNewCheckbox(text.UTF8String));

    return self;
}

- (void)setText: (OFString *)text
{
    uiCheckboxSetText(uiCheckbox(_control), text.UTF8String);
    _text = text;
}

- (void)setChecked: (bool)checked
{
    uiCheckboxSetChecked(uiCheckbox(_control), checked);
    _checked = checked;
}

- (void)setOnChanged: (void (^)(OUIControl *))onToggled
{
    self->onChanged = onToggled;
    uiCheckboxOnToggled(uiCheckbox(_control), &onToggledWrapper, (__bridge void *)self);
}

@end
