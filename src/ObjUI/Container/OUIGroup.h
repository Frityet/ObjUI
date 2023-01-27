#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUIGroup : OUIControl

@property(nonatomic, setter=setTitle:) OFString *title;
@property(nonatomic, setter=setMargined:) bool margined;
@property(nonatomic, setter=setChild:) OUIControl *child;



+ (instancetype)groupWithLabel: (OFString *)title;

- (instancetype)initWithLabel: (OFString *)title;

@end
