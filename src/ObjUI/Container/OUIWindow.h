#import <ObjFW/OFObject.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>

@interface OUIWindow : OUIControl

@property(setter=setOnClosing:) int (^onClosing)(OUIWindow *window);
@property(setter=setOnContentSizeChanged:) void (^onContentSizeChanged)(OUIWindow *window, int, int);

@property bool resizable;
@property bool fullscreen;
@property bool borderless;
@property bool margined;

@property OFString *title;
@property(setter=setContentSize:)int width;
@property(setter=setContentSize:)int height;

@property OUIControl *child;


+ (instancetype)windowWithTitle: (OFString *)title width: (int)width height: (int)height hasMenubar: (bool)hasMenuBar;
- (instancetype)initWithTitle: (OFString *)title width: (int)width height: (int)height hasMenubar: (bool)hasMenuBar;

- (void)close;

@end
