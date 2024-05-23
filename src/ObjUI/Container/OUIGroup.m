#include "OUIGroup.h"

@implementation OUIGroup

@synthesize child = _child;

+ (instancetype)groupWithLabel:(OFString *)title
{ return [[self alloc] initWithLabel:title]; }

- (instancetype)initWithLabel:(OFString *)title
{
    return [super initFromControl: uiControl(uiNewGroup(title.UTF8String))];
}

- (OFString *)title
{
    return [OFString stringWithUTF8String: uiGroupTitle(uiGroup(_control))];
}

- (void)setTitle:(OFString *)title
{
    uiGroupSetTitle(uiGroup(_control), title.UTF8String);
}

- (bool)margined
{
    return uiGroupMargined(uiGroup(_control));
}

- (void)setMargined:(bool)margined
{
    uiGroupSetMargined(uiGroup(_control), margined);
}

- (OUIControl *)child
{
    return _child;
}

- (void)setChild:(OUIControl *)child
{
    _child = child;
    uiGroupSetChild(uiGroup(_control), child.control);
    child.parent = self;
}

@end
