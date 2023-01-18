#include "OUIRadioButtons.h"

@implementation OUIRadioButtons

@synthesize onChanged;

+ (instancetype)radioButtonsWithLabels: (OFArray<OFString *> *)items
{ return [[self alloc] initWithLabels: items]; }

- (instancetype)initWithLabels: (OFArray<OFString *> *)items
{
    self = [super init];
    if (self == nil) return nil;

    _control = uiControl(uiNewRadioButtons());

    for (OFString *item in items)
        uiRadioButtonsAppend(uiRadioButtons(_control), item.UTF8String);

    return self;
}

- (void)append: (OFString *)item
{ uiRadioButtonsAppend(uiRadioButtons(_control), item.UTF8String); }

@end
