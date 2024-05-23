#include "OUIBox.h"
#include "ui.h"

#import <ObjFW/objfw-defs.h>

@implementation OUIBox

+ (instancetype)verticalBox
{ return [[self alloc] initWithVerticalOrientation: true]; }

+ (instancetype)horizontalBox
{ return [[self alloc] initWithVerticalOrientation: false]; }

- (instancetype)initWithVerticalOrientation:(bool)vertical
{
    self = [super initFromControl: uiControl(vertical ? uiNewVerticalBox() : uiNewHorizontalBox())];
    _vertical = vertical;
    return self;
}

- (bool)padded
{ return uiBoxPadded(uiBox(_control)); }
- (void)setPadded: (bool)padded
{ uiBoxSetPadded(uiBox(_control), padded); }

- (int)childCount
{ return uiBoxNumChildren(uiBox(_control)); }

- (void)appendControl: (OUIControl *)control
{ [self appendControl: control stretchy: false]; }

- (void)appendControl: (OUIControl *)control stretchy: (bool)stretchy
{
    uiBoxAppend(uiBox(_control), control.control, stretchy);
    control.parent = self;
}

- (void)delete: (int)index
{ uiBoxDelete(uiBox(_control), index); }

@end

