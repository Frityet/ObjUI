#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUIForm : OUIControl

@property(readonly) int childCount;
@property(nonatomic, setter=setPadded:) bool padded;

+ (instancetype)form;

- (void)append: (OUIControl *)control label: (OFString *)label stretchy: (bool)stretchy;
- (void)append: (OUIControl *)control label: (OFString *)label;
- (void)delete: (int)index;

@end
