#include "OUIEditableComboBox.h"

static void onChangedWrapper(uiEditableCombobox *control, void *data)
{
    OUIEditableComboBox *self = (__bridge OUIEditableComboBox *)data;
    self.onChanged(self);
}

@implementation OUIEditableComboBox

@synthesize onChanged;

+ (instancetype)editableComboBoxWithItems:(OFArray<OFString *> *)items
{ return [[self alloc] initWithItems: items]; }

- (instancetype)initWithItems:(OFArray<OFString *> *)items
{
    self = [super init];
    if (self == nil) return nil;

    _control = uiControl(uiNewEditableCombobox());

    for (OFString *item in items) {
        uiEditableComboboxAppend(uiEditableCombobox(_control), item.UTF8String);
    }

    return self;
}

- (void)setOnChanged:(void (^)(OUIControl *))fn
{
    onChanged = fn;
    uiEditableComboboxOnChanged(uiEditableCombobox(_control), &onChangedWrapper, (__bridge void *)self);
}

- (void)setText:(OFString *)text
{ uiEditableComboboxSetText(uiEditableCombobox(_control), text.UTF8String); }

- (OFString *)getText
{ return [OFString stringWithUTF8String: uiEditableComboboxText(uiEditableCombobox(_control))]; }

- (void)append: (OFString *)item
{
    uiEditableComboboxAppend(uiEditableCombobox(_control), item.UTF8String);
}

@end
