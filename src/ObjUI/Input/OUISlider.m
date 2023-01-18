#include "OUISlider.h"

static void onChangedWrapper(uiSlider *s, void *data)
{
    OUISlider *self = (__bridge OUISlider *)data;
    self.onChanged(self);
}

@implementation OUISlider

@synthesize onChanged;

+ (instancetype)slider
{ return [[self alloc] init]; }

+ (instancetype)sliderWithMin: (int)min max: (int)max
{ return [[self alloc] initWithMin: min max: max]; }

- (instancetype)init
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewSlider(0, 100));

    return self;
}

- (instancetype)initWithMin: (int)min max: (int)max
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewSlider(min, max));

    return self;
}

- (void)setValue: (int)value
{ uiSliderSetValue(uiSlider(_control), value); }

- (int)getValue
{ return uiSliderValue(uiSlider(_control)); }

- (void)setOnChanged: (void (^)(OUIControl *))fn
{
    self->onChanged = fn;
    uiSliderOnChanged(uiSlider(_control), &onChangedWrapper, (__bridge void *)self);
}

@end
