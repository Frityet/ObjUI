#import <ObjFW/OFObject.h>

#include <ui.h>

@interface OUIControl : OFObject {
    @protected uiControl *_control;
}

@property(nonatomic, setter=setEnabled:) bool enabled;

- (void)show;
- (uiControl *)control;
- (bool)isVisible;
- (void)dealloc;

@end
