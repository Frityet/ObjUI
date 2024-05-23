#include "OUIForm.h"

@implementation OUIForm

+ (instancetype)form
{ return [[self alloc] init]; }

- (instancetype)init
{ return [super initFromControl: uiControl(uiNewForm())]; }

- (void)appendControl: (OUIControl *)control label: (OFString *)label stretchy: (bool)stretchy
{
    uiFormAppend(uiForm(_control), [label UTF8String], uiControl(control.control), stretchy);
    control.parent = self;
}

- (void)appendControl: (OUIControl *)control label: (OFString *)label
{ [self appendControl: control label: label stretchy: 0]; }

- (void)delete: (int)index
{ uiFormDelete(uiForm(_control), index); }

- (bool)padded
{ return uiFormPadded(uiForm(_control)); }

- (void)setPadded: (bool)padded
{ uiFormSetPadded(uiForm(_control), padded); }

@end
