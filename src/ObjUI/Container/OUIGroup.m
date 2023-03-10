#include "OUIGroup.h"

@implementation OUIGroup

+ (instancetype)groupWithLabel:(OFString *)title
{ return [[self alloc] initWithLabel:title]; }

- (instancetype)initWithLabel:(OFString *)title
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewGroup(title.UTF8String));

    return self;
}

- (void)setTitle:(OFString *)title
{
    uiGroupSetTitle(uiGroup(_control), title.UTF8String);
    _title = title;
}

- (void)setMargined:(bool)margined
{
    uiGroupSetMargined(uiGroup(_control), margined);
    _margined = margined;
}

- (void)setChild:(OUIControl *)child
{
    _child = child;
    uiGroupSetChild(uiGroup(_control), child.control);
}

@end
