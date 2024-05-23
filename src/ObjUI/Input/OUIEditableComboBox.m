#include "OUIEditableComboBox.h"


@implementation OUIEditableComboBox

+ (instancetype)editableComboBoxWithItems:(OFArray<OFString *> *)items
{ return [[self alloc] initWithItems: items]; }

- (instancetype)initWithItems:(OFArray<OFString *> *)items
{
    self = [super initFromControl: uiControl(uiNewEditableCombobox()) onChangedSetter: uiEditableComboboxOnChanged];

    for (OFString *item in items) {
        uiEditableComboboxAppend(uiEditableCombobox(_control), item.UTF8String);
    }

    return self;
}

- (OFString *)text
{ return [OFString stringWithUTF8String: uiEditableComboboxText(uiEditableCombobox(_control))]; }

- (void)setText:(OFString *)text
{ uiEditableComboboxSetText(uiEditableCombobox(_control), text.UTF8String); }

- (void)append: (OFString *)item
{
    uiEditableComboboxAppend(uiEditableCombobox(_control), item.UTF8String);
}

@end
