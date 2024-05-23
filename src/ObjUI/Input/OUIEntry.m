#include "OUIEntry.h"

#import <ObjFW/OFInvalidArgumentException.h>


@implementation OUIEntry

+ (instancetype)entry
{ return [[self alloc] init]; }

+ (instancetype)passwordEntry
{ return [[self alloc] initWithType:OUIEntryTypePassword]; }

+ (instancetype)searchEntry
{ return [[self alloc] initWithType:OUIEntryTypeSearch]; }

+ (instancetype)multilineEntry
{ return [[self alloc] initWithType:OUIEntryTypeMultiline]; }

+ (instancetype)multilineNonWrappingEntry
{ return [[self alloc] initWithType: OUIEntryTypeNonWrappingMultiline]; }


- (instancetype)init
{
    return [super initFromControl: uiControl(uiNewEntry()) onChangedSetter: uiEntryOnChanged];
}

- (instancetype)initWithType:(enum OUIEntryType)type
{
    uiControl *control;
    switch (type) {
        case OUIEntryTypePassword:
            control = uiControl(uiNewPasswordEntry());
            break;
        case OUIEntryTypeSearch:
            control = uiControl(uiNewSearchEntry());
            break;
        case OUIEntryTypeMultiline:
            control = uiControl(uiNewMultilineEntry());
            break;
        case OUIEntryTypeNonWrappingMultiline:
            control = uiControl(uiNewNonWrappingMultilineEntry());
            break;
        default:
            @throw [OFInvalidArgumentException exception];
            break;
    }
    self = [super initFromControl: control onChangedSetter: uiEntryOnChanged];
    _type = type;
    return self;
}

- (instancetype)initFromControl:(uiControl *)control
{
    self = [super initFromControl: control];
    _type = OUIEntryTypeUnknown;
    return self;
}


- (OFString *)text
{
    return [OFString stringWithUTF8String: uiEntryText(uiEntry(_control))];
}


- (void)setText:(OFString *)text
{ uiEntrySetText(uiEntry(_control), text.UTF8String); }

- (bool)readonly
{ return uiEntryReadOnly(uiEntry(_control)); }

- (void)setReadonly: (bool)readonly
{ uiEntrySetReadOnly(uiEntry(_control), readonly); }

@end
