#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/objfw-defs.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

enum OUIEntryType {
    OUIEntryTypeUnknown,
    OUIEntryTypeNormal,
    OUIEntryTypePassword,
    OUIEntryTypeSearch,
    OUIEntryTypeMultiline,
    OUIEntryTypeNonWrappingMultiline,
};

@interface OUIEntry : OUIInput

@property OFString *text;
@property bool readonly;
@property(readonly) enum OUIEntryType type;

+ (instancetype)entry;
+ (instancetype)passwordEntry;
+ (instancetype)searchEntry;
+ (instancetype)multilineEntry;
+ (instancetype)multilineNonWrappingEntry;

- (instancetype)initWithType: (enum OUIEntryType)type;

@end

#pragma clang assume_nonnull end
