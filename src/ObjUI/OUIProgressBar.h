#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#include "OUIControl.h"

@interface OUIProgressBar : OUIControl

@property int progress;

+ (instancetype)progressBar;

@end
