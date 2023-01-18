#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUIGroup : OUIControl

@property(nonatomic, setter=setTitle:) OFString *title;
@property(nonatomic, setter=setMargined:) bool margined;


+ (instancetype)groupWithTitle: (OFString *)title;

- (instancetype)initWithTitle: (OFString *)title;
- (void)setChild: (OUIControl *)control;


@end
