#include "OUIControl.h"

#import <ObjFW/OFNotImplementedException.h>

@implementation OUIControl

- (void)show
{ uiControlShow(self.control); }

- (uiControl *)control
{ return _control; }

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
