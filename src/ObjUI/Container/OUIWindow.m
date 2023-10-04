#include "OUIWindow.h"

#import <ObjFW/OFString.h>
#import <ObjFW/OFValue.h>
#import <ObjFW/OFBlock.h>

#include <ui.h>

#define auto __auto_type

static int onCloseWrapper(uiWindow *_, void *data)
{
    OUIWindow *window = (__bridge OUIWindow *)data;
    return window.onClosing(window);
}

static void onContentSizeChangedWrapper(uiWindow *handle, void *data)
{
    auto window = (__bridge OUIWindow *)data;
    int width, height;
    uiWindowContentSize(handle, &width, &height);
    window.onContentSizeChanged(window, width, height);
}

@implementation OUIWindow

+ (instancetype)windowWithTitle:(OFString *)title width:(int)width height:(int)height hasMenubar:(bool)hasMenuBar
{ return [[self alloc] initWithTitle:title width:width height:height hasMenubar:hasMenuBar]; }

- (void)setOnClosing:(int (^)(OUIWindow *))onClosing
{
    _onClosing = onClosing;
    uiWindowOnClosing(uiWindow(self->_control), onCloseWrapper, (__bridge_retained void *)(self));
}

- (void)setOnContentSizeChanged:(void (^)(OUIWindow *, int, int))onContentSizeChanged
{
    _onContentSizeChanged = onContentSizeChanged;
    uiWindowOnContentSizeChanged(uiWindow(_control), &onContentSizeChangedWrapper, (__bridge_retained void *)self);
}

- (void)setContentSize:(int)width height:(int)height
{
    uiWindowSetContentSize(uiWindow(_control), width, height);
}

- (void)contentSize:(int *)width height:(int *)height
{
    uiWindowContentSize(uiWindow(_control), width, height);
}

- (void)setFullscreen:(bool)fullscreen
{
    _fullscreen = fullscreen;
    uiWindowSetFullscreen(uiWindow(_control), fullscreen);
}

- (void)setBorderless:(bool)borderless
{
    _borderless = borderless;
    uiWindowSetBorderless(uiWindow(_control), borderless);
}

- (void)setMargined:(bool)margined
{
    _margined = margined;
    uiWindowSetMargined(uiWindow(_control), margined);
}

- (instancetype)initWithTitle:(OFString *)title width:(int)width height:(int)height hasMenubar:(bool)hasMenuBar
{
    if ((self = [super init]) == nil) return nil;

    _control = uiControl(uiNewWindow(title.UTF8String, width, height, hasMenuBar));
    return self;
}

- (void)setChild:(OUIControl *)child
{
    _child = child;
    uiWindowSetChild(uiWindow(_control), uiControl(child.control));
}

- (void)close
{ uiControlDestroy(_control); }

@end
