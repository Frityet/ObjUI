#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>
#import <ObjFW/OFDate.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

enum OUIDateTimePickerType {
    OUIDateTimePickerDate = 1 << 0,
    OUIDateTimePickerTime = 1 << 1,
    OUIDateTimePickerDateTime = OUIDateTimePickerDate | OUIDateTimePickerTime,
};

@interface OUIDateTimePicker: OUIControl<OUIInput>

@property (nonatomic, readonly) enum OUIDateTimePickerType type;
@property (nonatomic, setter=setDate:, getter=getDate) OFDate *date;

+ (instancetype)datePicker;
+ (instancetype)timePicker;
+ (instancetype)dateTimePicker;

- (instancetype)initWithType: (enum OUIDateTimePickerType)type;

@end
