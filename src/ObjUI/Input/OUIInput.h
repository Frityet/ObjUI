#import <ObjUI/OUIControl.h>

@interface OUIInput : OUIControl {
    bool _usingOwnHandler;
}

@property void (^onChanged)(OUIControl *sender);

- (instancetype)initFromControl:(uiControl *)control onChangedSetter: (void *)setter;

- (void(*)(uiControl *, void *))onChangedCallback;

@end
