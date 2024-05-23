#import <ObjFW/OFObject.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUIControl : OFObject {
    @protected uiControl *_control;
}

@property(readonly) uiControl *control;
@property(nullable) OUIControl *parent;
@property bool enabled;
@property bool visible;

- (void)dealloc;

- (instancetype)initFromControl:(uiControl *)control;
+ (instancetype)fromControl:(uiControl *)control;

- (void)setParent: (uiControl *)parent ofClass: (Class)class;

@end

#pragma clang assume_nonnull end
