#include "OUIControl.h"

#import <ObjFW/OFNotImplementedException.h>

@implementation OUIControl

- (void)show
{ uiControlShow(self.control); }

- (uiControl *)control
{ return _control; }

- (void)setEnabled:(bool)enabled {
    _enabled = enabled;
    enabled ? uiControlEnable(self.control) : uiControlDisable(self.control);
}

- (bool)isVisible
{ return uiControlVisible(self.control); }

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
