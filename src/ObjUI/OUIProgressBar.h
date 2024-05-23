#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#include "OUIControl.h"

#pragma clang assume_nonnull begin

@interface OUIProgressBar : OUIControl

@property int progress;

+ (instancetype)progressBar;

@end

#pragma clang assume_nonnull end
