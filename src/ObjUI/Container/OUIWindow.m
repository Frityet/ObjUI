#include "OUIWindow.h"

#import <ObjFW/OFString.h>
#import <ObjFW/OFValue.h>
#import <ObjFW/OFBlock.h>

#include <ui.h>

static int onCloseWrapper(uiWindow *_, void *data)
{
    OUIWindow *window = (__bridge OUIWindow *)data;
    return window.onClosing ? window.onClosing(window) : 0;
}

static void onContentSizeChangedWrapper(uiWindow *handle, void *data)
{
    OUIWindow *window = (__bridge OUIWindow *)data;
    int width, height;
    uiWindowContentSize(handle, &width, &height);
    window.onContentSizeChanged ? window.onContentSizeChanged(window, width, height) : 0;
}

@implementation OUIWindow

@synthesize child = _child;
@synthesize onClosing = _onClosing;
@synthesize onContentSizeChanged = _onContentSizeChanged;

+ (instancetype)windowWithTitle:(OFString *)title width:(int)width height:(int)height hasMenubar:(bool)hasMenuBar
{ return [[self alloc] initWithTitle:title width:width height:height hasMenubar:hasMenuBar]; }

- (instancetype)initWithTitle:(OFString *)title width:(int)width height:(int)height hasMenubar:(bool)hasMenuBar
{
    self = [super initFromControl: uiControl(uiNewWindow(title.UTF8String, width, height, hasMenuBar))];
    uiWindowOnClosing(uiWindow(_control), onCloseWrapper, (__bridge_retained void *)self);
    uiWindowOnContentSizeChanged(uiWindow(_control), &onContentSizeChangedWrapper, (__bridge_retained void *)self);
    return self;
}

- (int (^)(OUIWindow *))onClosing
{ return _onClosing; }

- (void)setOnClosing:(int (^)(OUIWindow *))onClosing
{
    _onClosing = onClosing;
}

- (void (^)(OUIWindow *, int, int))onContentSizeChanged
{ return _onContentSizeChanged; }

- (void)setOnContentSizeChanged:(void (^)(OUIWindow *, int, int))onContentSizeChanged
{
    _onContentSizeChanged = onContentSizeChanged;
}

- (void)setContentSize:(int)width height:(int)height
{
    uiWindowSetContentSize(uiWindow(_control), width, height);
}

- (void)contentSize:(int *)width height:(int *)height
{
    uiWindowContentSize(uiWindow(_control), width, height);
}

- (bool)fullscreen
{ return uiWindowFullscreen(uiWindow(_control)); }

- (void)setFullscreen:(bool)fullscreen
{ uiWindowSetFullscreen(uiWindow(_control), fullscreen); }

- (bool)borderless
{ return uiWindowBorderless(uiWindow(_control)); }

- (void)setBorderless:(bool)borderless
{
    uiWindowSetBorderless(uiWindow(_control), borderless);
}

- (bool)margined
{ return uiWindowMargined(uiWindow(_control)); }

- (void)setMargined:(bool)margined
{ uiWindowSetMargined(uiWindow(_control), margined); }

- (OUIControl *)child
{ return _child; }

- (void)setChild:(OUIControl *)child
{
    _child = child;
    uiWindowSetChild(uiWindow(_control), uiControl(child.control));
}

- (void)close
{ uiControlDestroy(_control); }

@end
