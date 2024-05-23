#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUITab : OUIControl

@property(readonly) int pageCount;

+ (instancetype)tab;

- (void)appendControl: (OUIControl *)control label: (OFString *)label;
- (void)delete: (int)index;
- (void)insertAtIndex: (int)index with: (OUIControl *)control label: (OFString *)label;
- (void)setMargined: (bool)margined atIndex: (int)index;

@end

#pragma clang assume_nonnull end
