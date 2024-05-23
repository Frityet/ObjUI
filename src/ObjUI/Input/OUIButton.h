#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUIButton : OUIInput

@property OFString *text;

+ (instancetype)buttonWithLabel: (OFString *)text;
- (instancetype)initWithText: (OFString *)text;


@end

#pragma clang assume_nonnull end
