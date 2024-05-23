#import <ObjFW/OFObject.h>

#include <ui.h>

@interface OUIControl : OFObject {
    @protected uiControl *_control;
}

@property(readonly) uiControl *control;
@property bool enabled;
@property bool visible;

- (void)dealloc;

- (instancetype)initFromControl:(uiControl *)control;
+ (instancetype)fromControl:(uiControl *)control;

@end
