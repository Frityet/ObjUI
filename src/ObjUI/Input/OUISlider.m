#include "OUISlider.h"

@implementation OUISlider

+ (instancetype)slider
{ return [[self alloc] init]; }

+ (instancetype)sliderWithMin: (int)min max: (int)max
{ return [[self alloc] initWithMin: min max: max]; }

- (instancetype)init
{ return [self initWithMin: 0 max: 100]; }

- (instancetype)initWithMin: (int)min max: (int)max
{
    return [super initFromControl: uiControl(uiNewSlider(min, max)) onChangedSetter: uiSliderOnChanged];
}

- (int)value
{ return uiSliderValue(uiSlider(_control)); }

- (void)setValue: (int)value
{ uiSliderSetValue(uiSlider(_control), value); }

@end
