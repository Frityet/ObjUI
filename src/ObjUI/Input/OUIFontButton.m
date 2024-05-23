#include "OUIFontButton.h"
#include "ui.h"


@implementation OUIFontButton

+ (instancetype)fontButton
{ return [[self alloc] init];}

- (instancetype)init
{
    return [super initFromControl: uiControl(uiNewFontButton()) onChangedSetter: uiFontButtonOnChanged];
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
