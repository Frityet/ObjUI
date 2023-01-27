#include "OUIForm.h"

@implementation OUIForm

+ (instancetype)form
{ return [[self alloc] init]; }

- (instancetype)init
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewForm());

    return self;
}

- (void)appendControl: (OUIControl *)control label: (OFString *)label stretchy: (bool)stretchy
{ uiFormAppend(uiForm(_control), [label UTF8String], uiControl(control.control), stretchy); }

- (void)appendControl: (OUIControl *)control label: (OFString *)label
{ [self appendControl: control label: label stretchy: 0]; }

- (void)delete: (int)index
{ uiFormDelete(uiForm(_control), index); }

@end
