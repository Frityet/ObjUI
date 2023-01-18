#include "OUISpinbox.h"

static void onChangedWrapper(uiSpinbox *spinbox, void *data)
{
    OUISpinbox *self = (__bridge OUISpinbox *)data;
    self.onChanged(self);
}

@implementation OUISpinbox

@synthesize onChanged;

+ (instancetype)spinbox
{ return [[self alloc] init]; }

+ (instancetype)spinboxWithMin: (int)min max: (int)max
{ return [[self alloc] initWithMin: min max: max]; }

- (instancetype)init
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewSpinbox(0, 100));

    return self;
}

- (instancetype)initWithMin: (int)min max: (int)max
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewSpinbox(min, max));

    return self;
}

- (void)setValue: (int)value
{ uiSpinboxSetValue(uiSpinbox(_control), value); }

- (int)getValue
{ return uiSpinboxValue(uiSpinbox(_control)); }

- (void)setOnChanged: (void (^)(OUIControl *))fn
{
    self->onChanged = fn;
    uiSpinboxOnChanged(uiSpinbox(_control), &onChangedWrapper, (__bridge void *)self);
}

@end
