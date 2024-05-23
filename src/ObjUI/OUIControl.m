#include "OUIControl.h"

#import <ObjFW/OFNotImplementedException.h>
#import <ObjFW/OFInitializationFailedException.h>

@implementation OUIControl

@synthesize parent = _parent;

- (void)show
{ uiControlShow(self.control); }

- (uiControl *)control
{ return _control; }

- (OUIControl *_Nullable)parent
{
    if (_parent == nil) {
        uiControl *parent = uiControlParent(self.control);
        if (parent == NULL)
            return nil;

        _parent = [OUIControl fromControl: parent];
    }

    return _parent;
}

- (void)setParent: (OUIControl *_Nullable)parent
{
    _parent = parent;

    if (_parent && uiControlParent(self.control) != _parent.control) {
        uiControlSetParent(self.control, NULL);
        uiControlSetParent(self.control, _parent.control);
    }
}

- (void)setParent:(uiControl *)parent ofClass: (Class)class
{
    //make sure the class is a subclass of OUIControl
    if (![class isSubclassOfClass: OUIControl.class])
        @throw [OFInitializationFailedException exceptionWithClass: class];

    self.parent = [class fromControl: parent];
}

- (bool)enabled
{ return uiControlEnabled(self.control); }

- (void)setEnabled:(bool)enabled
{ enabled ? uiControlEnable(self.control) : uiControlDisable(self.control); }

- (bool)visible
{ return uiControlVisible(self.control); }

- (void)setVisible:(bool)isVisible
{ isVisible ? uiControlShow(self.control) : uiControlHide(self.control); }

- (void)dealloc
{ /*uiControlDestroy(self.control);*/ }

- (instancetype)initFromControl:(uiControl *)control
{
    self = [super init];

    self->_control = control;

    return self;
}

+ (instancetype)fromControl:(uiControl *)control
{ return [[self alloc] initFromControl:control]; }

@end
