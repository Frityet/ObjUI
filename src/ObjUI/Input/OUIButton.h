#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

@interface OUIButton : OUIInput

@property OFString *text;

+ (instancetype)buttonWithLabel: (OFString *)text;
- (instancetype)initWithText: (OFString *)text;


@end
