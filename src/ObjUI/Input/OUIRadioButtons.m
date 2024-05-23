#include "OUIRadioButtons.h"

@implementation OUIRadioButtons

+ (instancetype)radioButtonsWithLabels: (OFArray<OFString *> *)items
{ return [[self alloc] initWithLabels: items]; }

- (instancetype)initWithLabels : (OFArray<OFString *> *)items
{
    self = [super initFromControl: uiControl(uiNewRadioButtons()) onChangedSetter: uiRadioButtonsOnSelected];

    for (OFString *item in items)
        uiRadioButtonsAppend(uiRadioButtons(_control), item.UTF8String);

    return self;
}

- (void)append: (OFString *)item
{ uiRadioButtonsAppend(uiRadioButtons(_control), item.UTF8String); }

@end
