#include "OUITab.h"

@implementation OUITab

+ (instancetype)tab
{ return [[self alloc] init]; }

- (instancetype)init
{ return [super initFromControl: uiControl(uiNewTab())]; }

- (void)appendControl:(OUIControl *)control label: (OFString *)name
{
    uiTabAppend(uiTab(_control), name.UTF8String, control.control);
    control.parent = self;
}

- (void)insertAtIndex:(int)index with:(OUIControl *)control label:(OFString *)name
{ uiTabInsertAt(uiTab(_control), name.UTF8String, index, control.control); }

- (void)setMargined:(bool)margined atIndex:(int)index
{ uiTabSetMargined(uiTab(_control), index, margined); }

- (void)delete:(int)index
{ uiTabDelete(uiTab(_control), index); }

- (int)pageCount
{ return uiTabNumPages(uiTab(_control)); }

@end
