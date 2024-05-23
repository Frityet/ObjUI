#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>
#import <ObjFW/OFDate.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

enum OUIDateTimePickerType {
    OUIDateTimePickerUnknown    = 0,
    OUIDateTimePickerDate       = 1 << 0,
    OUIDateTimePickerTime       = 1 << 1,
    OUIDateTimePickerDateTime   = OUIDateTimePickerDate | OUIDateTimePickerTime,
};

@interface OUIDateTimePicker: OUIInput

@property(readonly) enum OUIDateTimePickerType type;
@property OFDate *date;

+ (instancetype)datePicker;
+ (instancetype)timePicker;
+ (instancetype)dateTimePicker;

- (instancetype)initWithType: (enum OUIDateTimePickerType)type;

@end

#pragma clang assume_nonnull end
