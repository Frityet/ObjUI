#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUILabel : OUIControl

@property(nonatomic, setter=setText:) OFString *text;

+ (instancetype)labelWithText: (OFString *)text;
- (instancetype)initWithText: (OFString *)text;

@end
