#include "OUIWindow.h"

#import <ObjFW/OFString.h>

#include <ui.h>

static int onCloseWrapper(uiWindow *window, void *data)
{
    int (^onClose)() = (__bridge int (^)())data;
    return onClose();
}

static void onContentSizeChangedWrapper(uiWindow *window, void *data)
{
    void (^onContentSizeChanged)(int, int) = (__bridge void (^)(int, int))data;
    int width, height;
    uiWindowContentSize(window, &width, &height);
    onContentSizeChanged(width, height);
}

@implementation OUIWindow

+ (instancetype)windowWithTitle:(OFString *)title width:(int)width height:(int)height hasMenubar:(bool)hasMenuBar
{ return [[self alloc] initWithTitle:title width:width height:height hasMenubar:hasMenuBar]; }

- (void)setOnClosing:(int (^)())onClosing
{
    _onClosing = onClosing;
    uiWindowOnClosing((uiWindow *)_control, &onCloseWrapper, (__bridge void *)onClosing);
}

- (void)setOnContentSizeChanged:(void (^)(int, int))onContentSizeChanged
{
    _onContentSizeChanged = onContentSizeChanged;
    uiWindowOnContentSizeChanged(uiWindow(_control), &onContentSizeChangedWrapper, (__bridge void *)onContentSizeChanged);
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

@end
