#include "OUIBox.h"
#include "ui.h"

#import <ObjFW/objfw-defs.h>

@implementation OUIBox

+ (instancetype)verticalBox
{ return [[self alloc] initWithVerticalOrientation: 1]; }

+ (instancetype)horizontalBox
{ return [[self alloc] initWithVerticalOrientation: 0]; }

- (instancetype)initWithVerticalOrientation:(bool)vertical
{
    if ((self = [super init]) == nil) return nil;

    _vertical = vertical;
    _control = uiControl(vertical ? uiNewVerticalBox() : uiNewHorizontalBox());

    return self;
}

- (void)setPadded: (bool)padded
{
    _padded = padded;
    uiBoxSetPadded(uiBox(_control), padded);
}

- (int)childCount
{ return uiBoxNumChildren(uiBox(_control)); }

- (void)appendControl: (OUIControl *)control
{ [self appendControl: control stretchy: 0]; }

- (void)appendControl: (OUIControl *)control stretchy: (bool)stretchy
{ uiBoxAppend(uiBox(_control), control.control, stretchy); }

- (void)delete: (int)index
{ uiBoxDelete(uiBox(_control), index); }

@end

