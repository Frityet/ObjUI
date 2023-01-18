#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUITab : OUIControl

@property(readonly) int pageCount;

+ (instancetype)tab;

- (void)append: (OUIControl *)control label: (OFString *)label;
- (void)delete: (int)index;
- (void)insertAt: (int)index with: (OUIControl *)control label: (OFString *)label;
- (void)setMargined: (bool)margined at: (int)index;

@end
