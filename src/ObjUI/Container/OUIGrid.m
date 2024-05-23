#include "OUIGrid.h"

@implementation OUIGrid

+ (instancetype)grid
{ return [[self alloc] init]; }

- (instancetype)init
{ return [super initFromControl: uiControl(uiNewGrid())]; }

- (void)appendControl: (OUIControl *)control
                 left: (int)left
                  top: (int)top
                xSpan: (int)xspan
                ySpan: (int)yspan
              hExpand: (bool)hexpand
              vExpand: (bool)vexpand
               hAlign: (int)hAlign
               vAlign: (int)vAlign
{
    uiGridAppend(uiGrid(_control),  control.control, left, top, xspan, yspan, hexpand, vexpand, hAlign, vAlign);
    control.parent = self;
}

- (bool)padded
{ return uiGridPadded(uiGrid(_control)); }

- (void)setPadded: (bool)padded
{ uiGridSetPadded(uiGrid(_control), padded); }

@end
