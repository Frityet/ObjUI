#include "OUIControl.h"

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

@end
