#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

@interface OUICheckbox : OUIInput

@property OFString *text;
@property bool checked;

+ (instancetype)checkboxWithLabel: (OFString *)text;
- (instancetype)initWithLabel: (OFString *)text;

@end
