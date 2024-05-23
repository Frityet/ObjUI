#import <ObjUI/OUIControl.h>

#pragma clang assume_nonnull begin

@interface OUIInput : OUIControl {
    bool _usingOwnHandler;
}

@property void (^onChanged)(OUIControl *sender);

- (instancetype)initFromControl:(uiControl *)control onChangedSetter: (void *)setter;

- (void(*)(uiControl *, void *))onChangedCallback;

@end

#pragma clang assume_nonnull end
