#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>


#include <ui.h>


@interface OUIMenuItem : OFObject {
    @private uiMenuItem *_menuItem;
}

@property (nonatomic, setter=setEnabled:, getter=isEnabled) bool enabled;
@property (nonatomic, setter=setChecked:, getter=isChecked) bool checked;
@property (nonatomic, setter=setOnClicked:) void (^onClicked)(OUIMenuItem *sender);
@property (nonatomic, readonly) OFString *title;

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
