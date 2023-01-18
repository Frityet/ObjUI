#include "OUIButton.h"


static void onClickedWrapper(uiButton *button, void *data)
{
    void (^onClicked)() = (__bridge void (^)())data;
    onClicked();
}

@implementation OUIButton

@synthesize onChanged;

+ (instancetype)buttonWithText:(OFString *)text
{ return [[self alloc] initWithText:text]; }

- (instancetype)initWithText:(OFString *)text
{
    self = [super init];
    if (self == nil) return nil;

    _control = uiControl(uiNewButton(text.UTF8String));

    return self;
}

- (void)setText:(OFString *)text
{
    uiButtonSetText(uiButton(_control), text.UTF8String);
    _text = text;
}

- (void)setOnChanged:(void (^)())onClicked
{
    self->onChanged = onClicked;
    uiButtonOnClicked(uiButton(_control), &onClickedWrapper, (__bridge void *)onChanged);
}


@end
