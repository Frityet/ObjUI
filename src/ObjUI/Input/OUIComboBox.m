#include "OUIComboBox.h"

@implementation OUIComboBox

+ (instancetype)comboBoxWithItems:(OFArray<OFString *> *)items
{ return [[self alloc] initWithItems:items]; }

- (instancetype)initWithItems:(OFArray<OFString *> *)items
{
    self = [super initFromControl: uiControl(uiNewCombobox()) onChangedSetter: uiComboboxOnSelected];
    _items = [items mutableCopy];

    for (OFString *item in items) {
        uiComboboxAppend(uiCombobox(_control), item.UTF8String);
    }

    return self;
}

- (instancetype)initFromControl:(uiControl *)control
{
    self = [super initFromControl: control];
    _items = [OFMutableArray array];
    return self;
}

- (int)itemCount
{ return uiComboboxNumItems(uiCombobox(_control)); }

- (int)selectedIndex
{ return uiComboboxSelected(uiCombobox(_control)); }

- (void)setSelectedIndex: (int)selected
{ uiComboboxSetSelected(uiCombobox(_control), selected); }

- (OFArray<OFString *> *)items
{ return _items; }

- (void)setItems: (OFArray<OFString *> *)items
{
    [self clear];
    for (OFString *item in items) {
        uiComboboxAppend(uiCombobox(_control), item.UTF8String);
    }
    _items = [items mutableCopy];
}

- (void)append: (OFString *)item
{
    uiComboboxAppend(uiCombobox(_control), item.UTF8String);
    [_items addObject:item];
}

- (void)insert: (OFString *)item atIndex: (int)index
{
    uiComboboxInsertAt(uiCombobox(_control), index, item.UTF8String);
    [_items insertObject:item atIndex:index];
}

- (void)delete: (int)index
{
    uiComboboxDelete(uiCombobox(_control), index);
    [_items removeObjectAtIndex:index];
}

- (OFString *)selected
{
    int sel = self.selectedIndex;
    if (sel < 0) return nil;

    return _items[sel];
}

- (void)clear
{
    while (self.itemCount > 0) {
        uiComboboxDelete(uiCombobox(_control), 0);
    }
}

@end
