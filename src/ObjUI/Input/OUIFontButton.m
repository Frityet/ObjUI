#include "OUIFontButton.h"
#include "ui.h"

static void onChangedWrapper(uiFontButton *button, void *data)
{
    OUIFontButton *self = (__bridge OUIFontButton *)data;
    self.onChanged(self);
}

@implementation OUIFontButton

@synthesize onChanged;

+ (instancetype)fontButton
{ return [[self alloc] init];}

- (instancetype)init
{
    if (!(self = [super init])) return nil;
    _control = uiControl(uiNewFontButton());
    uiFontButtonOnChanged(uiFontButton(_control), onChangedWrapper, (__bridge void *)self);
    return self;
}

- (OUIFont)font
{
    uiFontDescriptor desc = {0};
    uiFontButtonFont(uiFontButton(_control), &desc);
    OUIFont font = {
        .family = [OFString stringWithUTF8String: desc.Family],
        .size = desc.Size,
        .weight = desc.Weight,
        .italic = desc.Italic,
        .stretch = desc.Stretch,
    };
    uiFreeFontDescriptor(&desc);
    return font;
}

@end
