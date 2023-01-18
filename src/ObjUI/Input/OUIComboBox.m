#include "OUIComboBox.h"

@implementation OUIComboBox

static void onChangedWrapper(uiCombobox *combobox, void *data)
{
    OUIComboBox *self = (__bridge OUIComboBox *)data;
    self.onChanged(self);
}

@synthesize onChanged;

+ (instancetype)comboBoxWithItems:(OFArray<OFString *> *)items
{ return [[self alloc] initWithItems:items]; }

- (instancetype)initWithItems:(OFArray<OFString *> *)items
{
    self = [super init];
    if (self == nil) return nil;

    _control = uiControl(uiNewCombobox());
    _items = [items mutableCopy];

    for (OFString *item in items) {
        uiComboboxAppend(uiCombobox(_control), item.UTF8String);
    }

    return self;
}

- (void)setSelected:(int)selected
{
    uiComboboxSetSelected(uiCombobox(_control), selected);
    _selectedIndex = selected;
}

- (void)setItems:(OFArray<OFString *> *)items
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

- (void)insert: (OFString *)item at: (int)index
{
    uiComboboxInsertAt(uiCombobox(_control), index, item.UTF8String);
    [_items insertObject:item atIndex:index];
}

- (void)delete: (int)index
{
    uiComboboxDelete(uiCombobox(_control), index);
    [_items removeObjectAtIndex:index];
}

- (int)getSelectedIndex
{
    _selectedIndex = uiComboboxSelected(uiCombobox(_control));
    return _selectedIndex;
}

- (int)itemCount
{ return uiComboboxNumItems(uiCombobox(_control)); }

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

- (void)setOnChanged:(void (^)(OUIControl *))fn
{
    self->onChanged = fn;
    uiComboboxOnSelected(uiCombobox(_control), onChangedWrapper, (__bridge void *)self);
}

@end
