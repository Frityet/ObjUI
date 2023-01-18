#include "OUIButton.h"


static void onClickedWrapper(uiButton *button, void *data)
{
    OUIButton *self = (__bridge OUIButton *)data;
    self.onChanged(self);
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

- (void)setOnChanged:(void (^)(OUIControl *))onClicked
{
    self->onChanged = onClicked;
    uiButtonOnClicked(uiButton(_control), &onClickedWrapper, (__bridge void *)self);
}


@end
