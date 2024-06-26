#include "OUIMenu.h"

static void onChangedWrapper(uiMenuItem *menuItem, uiWindow *window, void *data)
{
    OUIMenuItem *item = (__bridge OUIMenuItem *)data;
    item.onClicked ? item.onClicked(item) : 0;
}

@implementation OUIMenuItem

@synthesize enabled = _enabled;
@synthesize onClicked = _onClicked;

+ (instancetype)menuItemWithHandle:(uiMenuItem *)menuItem title:(OFString *)title
{ return [[self alloc] initWithHandle: menuItem title: title]; }

- (instancetype)initWithHandle:(uiMenuItem *)menuItem title:(OFString *)title
{
    if (!(self = [super init])) return nil;
    _menuItem = menuItem;
    _title = title;
    return self;
}

- (bool)enabled
{ return _enabled; }

- (void)setEnabled:(bool)enabled
{
    _enabled = enabled;
    enabled ? uiMenuItemEnable(_menuItem) : uiMenuItemDisable(_menuItem);
}

- (bool)checked
{ return uiMenuItemChecked(_menuItem); }
- (void)setChecked:(bool)checked
{
    uiMenuItemSetChecked(_menuItem, checked);
}

- (void (^)(OUIMenuItem *))onClicked
{ return _onClicked; }
- (void)setOnClicked:(void (^)(OUIMenuItem *))onChanged
{
    _onClicked = onChanged;
    uiMenuItemOnClicked(_menuItem, onChangedWrapper, (__bridge_retained void *)self);
}

@end

@implementation OUIMenu

+ (instancetype)menuWithTitle:(OFString *)name
{ return [[self alloc] initWithTitle: name]; }

- (instancetype)initWithTitle:(OFString *)name
{
    if (!(self = [super init])) return nil;
    _menu = uiNewMenu(name.UTF8String);
    return self;
}

- (OUIMenuItem *)appendItem:(OFString *)item
{
    uiMenuItem *menuItem = uiMenuAppendItem(_menu, item.UTF8String);
    return [OUIMenuItem menuItemWithHandle: menuItem title: item];
}

- (OUIMenuItem *)appendCheckItem:(OFString *)name
{
    uiMenuItem *menuItem = uiMenuAppendCheckItem(_menu, name.UTF8String);
    return [OUIMenuItem menuItemWithHandle: menuItem title: name];
}

- (OUIMenuItem *)appendQuitItem
{
    uiMenuItem *menuItem = uiMenuAppendQuitItem(_menu);
    return [OUIMenuItem menuItemWithHandle: menuItem title: @"Quit"];
}

- (OUIMenuItem *)appendPreferencesItem
{
    uiMenuItem *menuItem = uiMenuAppendPreferencesItem(_menu);
    return [OUIMenuItem menuItemWithHandle: menuItem title: @"Preferences"];
}

- (OUIMenuItem *)appendAboutItem
{
    uiMenuItem *menuItem = uiMenuAppendAboutItem(_menu);
    return [OUIMenuItem menuItemWithHandle: menuItem title: @"About"];
}

- (void)appendSeparator
{ uiMenuAppendSeparator(_menu); }

@end
