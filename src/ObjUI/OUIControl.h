#import <ObjFW/OFObject.h>

#include <ui.h>

@interface OUIControl : OFObject {
    @protected uiControl *_control;
}

@property(readonly) uiControl *control;
@property(nonatomic, setter=setEnabled:) bool enabled;

- (void)show;
- (bool)isVisible;
- (void)dealloc;

@end
