#include "OUIEntry.h"

#import <ObjFW/OFInvalidArgumentException.h>

static void onChangedWrapper(uiEntry *entry, void *data)
{
    OUIEntry *self = (__bridge OUIEntry *)data;
    self.text = [OFString stringWithUTF8String:uiEntryText(entry)];
    self.onChanged(self);
}

@implementation OUIEntry

@synthesize onChanged;

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
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewEntry());

    return self;
}

- (instancetype)initWithType:(enum OUIEntryType)type
{
    if ((self = [super init]) == nil) return nil;

    switch (type) {
        case OUIEntryTypePassword:
            _control = uiControl(uiNewPasswordEntry());
            break;
        case OUIEntryTypeSearch:
            _control = uiControl(uiNewSearchEntry());
            break;
        case OUIEntryTypeMultiline:
            _control = uiControl(uiNewMultilineEntry());
            break;
        case OUIEntryTypeNonWrappingMultiline:
            _control = uiControl(uiNewNonWrappingMultilineEntry());
            break;
        default:
            @throw [OFInvalidArgumentException exception];
            break;
    }

    return self;
}

- (void)setText:(OFString *)text
{ uiEntrySetText(uiEntry(_control), text.UTF8String); }

- (OFString *)getText
{
    char *txt = uiEntryText(uiEntry(_control));
    OFString *ret = [OFString stringWithUTF8String: txt];
    uiFreeText(txt);
    return ret;
}

- (void)setOnChanged:(void (^)(OUIControl *))fn
{
    self->onChanged = fn;
    uiEntryOnChanged(uiEntry(_control), &onChangedWrapper, (__bridge void *)self);
}

- (void)setReadonly:(bool)readonly
{
    uiEntrySetReadOnly(uiEntry(_control), readonly);
    _readonly = readonly;
}

@end
