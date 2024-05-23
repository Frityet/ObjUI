#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUICheckbox : OUIInput

@property OFString *text;
@property bool checked;

+ (instancetype)checkboxWithLabel: (OFString *)text;
- (instancetype)initWithLabel: (OFString *)text;

@end

#pragma clang assume_nonnull end
