#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>
#import <ObjFW/OFDate.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

@interface OUIDateTimePicker: OUIControl<OUIInput>

+ (instancetype)datePicker;
+ (instancetype)timePicker;
+ (instancetype)dateTimePicker;

@end
