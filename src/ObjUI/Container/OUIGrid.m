#include "OUIGrid.h"

@implementation OUIGrid

+ (instancetype)grid
{ return [[self alloc] init]; }

- (instancetype)init
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewGrid());

    return self;
}

- (void)append: (OUIControl *)control
          left: (int)left
           top: (int)top
         xSpan: (int)xspan
         ySpan: (int)yspan
       hExpand: (bool)hexpand
       vExpand: (bool)vexpand
        hAlign: (int)hAlign
        vAlign: (int)vAlign
{ uiGridAppend(uiGrid(_control),  control.control, left, top, xspan, yspan, hexpand, vexpand, hAlign, vAlign); }

@end
