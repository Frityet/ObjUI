#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUILabel : OUIControl

@property OFString *text;

+ (instancetype)labelWithText: (OFString *)text;
- (instancetype)initWithText: (OFString *)text;

@end

#pragma clang assume_nonnull end
