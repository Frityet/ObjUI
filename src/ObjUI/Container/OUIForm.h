#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUIForm : OUIControl

@property(readonly) int childCount;
@property bool padded;

+ (instancetype)form;

- (void)appendControl: (OUIControl *)control label: (OFString *)label stretchy: (bool)stretchy;
- (void)appendControl: (OUIControl *)control label: (OFString *)label;
- (void)delete: (int)index;

@end

#pragma clang assume_nonnull end
