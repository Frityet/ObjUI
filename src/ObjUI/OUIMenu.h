#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUIMenuItem : OFObject {
    @private uiMenuItem *_menuItem;
}

@property bool enabled;
@property bool checked;
@property void (^onClicked)(OUIMenuItem *sender);
@property(readonly) OFString *title;

+ (instancetype)menuItemWithHandle: (uiMenuItem *)menuItem title: (OFString *)title;

- (instancetype)initWithHandle: (uiMenuItem *)menuItem title: (OFString *)title;

@end

@interface OUIMenu : OFObject {
    @private uiMenu *_menu;
}

+ (instancetype)menuWithTitle: (OFString *)name;

- (instancetype)initWithTitle: (OFString *)name;

- (OUIMenuItem *)appendItem: (OFString *)item;
- (OUIMenuItem *)appendCheckItem: (OFString *)name;
- (OUIMenuItem *)appendQuitItem;
- (OUIMenuItem *)appendPreferencesItem;
- (OUIMenuItem *)appendAboutItem;
- (void)appendSeparator;



@end

#pragma clang assume_nonnull end
