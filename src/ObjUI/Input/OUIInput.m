#include "OUIInput.h"

static void onChangedCallback(uiControl *control, void *data)
{
    OUIInput *input = (__bridge OUIInput *)data;
    input.onChanged ? input.onChanged(input) : 0;
}

@implementation OUIInput

- (instancetype)initFromControl:(uiControl *)control
{
    self = [super initFromControl: control];
    _usingOwnHandler = false;
    return self;
}

- (instancetype)initFromControl:(uiControl *)control onChangedSetter: (void *)setter
{
    self = [super initFromControl: control];
    ((void(*)(uiControl *, void (*)(uiControl *, void *), void *))setter)(control, &onChangedCallback, (__bridge_retained void *)self);
    _usingOwnHandler = true;
    return self;
}

- (void (*)(uiControl *, void *))onChangedCallback
{ return &onChangedCallback; }

@end
