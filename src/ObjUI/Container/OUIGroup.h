#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUIGroup : OUIControl

@property OFString *title;
@property bool margined;
@property OUIControl *child;

+ (instancetype)groupWithLabel: (OFString *)title;
- (instancetype)initWithLabel: (OFString *)title;

@end
