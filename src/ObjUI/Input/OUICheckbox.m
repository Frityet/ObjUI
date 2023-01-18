#include "OUICheckbox.h"

static void onToggledWrapper(uiCheckbox *checkbox, void *data)
{
    void (^onToggled)() = (__bridge void (^)(void))data;
    onToggled();
}

@implementation OUICheckbox

@synthesize onChanged;

+ (instancetype)checkboxWithText: (OFString *)text
{ return [[self alloc] initWithText: text]; }

- (instancetype)initWithText: (OFString *)text
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

- (void)setOnChanged: (void (^)())onToggled
{
    self->onChanged = onToggled;
    uiCheckboxOnToggled(uiCheckbox(_control), &onToggledWrapper, (__bridge void *)onChanged);
}

@end
