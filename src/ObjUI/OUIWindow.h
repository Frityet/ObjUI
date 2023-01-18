#import <ObjFW/OFObject.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>

@interface OUIWindow : OUIControl

@property(nonatomic, setter=setOnClosing:) int (^onClosing)();
@property(nonatomic, setter=setOnContentSizeChanged:) void (^onContentSizeChanged)(int, int);

@property(nonatomic, setter=setResizable:) bool resizable;
@property(nonatomic, setter=setFullscreen:) bool fullscreen;
@property(nonatomic, setter=setBorderless:) bool borderless;
@property(nonatomic, setter=setMargined:) bool margined;

@property(nonatomic, setter=setTitle:) OFString *title;
@property(nonatomic, setter=setContentSize:) int width;
@property(nonatomic, setter=setContentSize:) int height;

@property(nonatomic, setter=setChild:) OUIControl *child;


+ (instancetype)windowWithTitle: (OFString *)title width: (int)width height: (int)height hasMenubar: (bool)hasMenuBar;
- (instancetype)initWithTitle: (OFString *)title width: (int)width height: (int)height hasMenubar: (bool)hasMenuBar;

@end
