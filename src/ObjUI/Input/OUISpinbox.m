#include "OUISpinbox.h"

@implementation OUISpinbox

+ (instancetype)spinbox
{ return [[self alloc] init]; }

+ (instancetype)spinboxWithMin: (int)min max: (int)max
{ return [[self alloc] initWithMin: min max: max]; }

- (instancetype)init
{
    return [self initWithMin: 0 max: 100];
}

- (instancetype)initWithMin: (int)min max: (int)max
{
    return [super initFromControl: uiControl(uiNewSpinbox(min, max)) onChangedSetter: uiSpinboxOnChanged];
}


- (int)value
{ return uiSpinboxValue(uiSpinbox(_control)); }

- (void)setValue: (int)value
{ uiSpinboxSetValue(uiSpinbox(_control), value); }

@end
