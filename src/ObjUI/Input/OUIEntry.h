#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/objfw-defs.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

enum OUIEntryType {
    OUIEntryTypeNormal,
    OUIEntryTypePassword,
    OUIEntryTypeSearch,
    OUIEntryTypeMultiline,
    OUIEntryTypeNonWrappingMultiline,
};

@interface OUIEntry : OUIControl<OUIInput>

@property(nonatomic, setter=setText:) OFString *text;
@property(nonatomic, setter=setReadonly:) bool readonly;
@property(readonly) enum OUIEntryType type;

+ (instancetype)entry;
+ (instancetype)passwordEntry;
+ (instancetype)searchEntry;
+ (instancetype)multilineEntry;
+ (instancetype)multilineNonWrappingEntry;

- (instancetype)initWithType: (enum OUIEntryType)type;

@end
