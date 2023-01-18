#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#include "OUIControl.h"

@interface OUIProgressBar : OUIControl

@property (nonatomic, setter=setProgress:, getter=getProgress) int progress;

+ (instancetype)progressBar;

@end
