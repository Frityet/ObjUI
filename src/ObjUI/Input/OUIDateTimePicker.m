#include "OUIDateTimePicker.h"

#include <time.h>

#import <ObjFW/OFInvalidArgumentException.h>
#import <ObjFW/OFInitializationFailedException.h>

@implementation OUIDateTimePicker

+ (instancetype)datePicker
{ return [[self alloc] initWithType: OUIDateTimePickerDate];}

+ (instancetype)timePicker
{ return [[self alloc] initWithType: OUIDateTimePickerTime];}

+ (instancetype)dateTimePicker
{ return [[self alloc] initWithType: OUIDateTimePickerDateTime];}

- (instancetype)initWithType: (enum OUIDateTimePickerType)type
{
    uiControl *control;
    switch (type) {
        case OUIDateTimePickerDate:
            control = uiControl(uiNewDatePicker());
            break;
        case OUIDateTimePickerTime:
            control = uiControl(uiNewTimePicker());
            break;

        case OUIDateTimePickerDateTime:
            control = uiControl(uiNewDateTimePicker());
            break;

        default:
            @throw [OFInvalidArgumentException exception];
    }

    self = [super initFromControl: control onChangedSetter: uiDateTimePickerOnChanged];
    _type = type;
    return self;
}

- (instancetype)initFromControl:(uiControl *)control
{
    self = [super initFromControl: control];
    _type = OUIDateTimePickerUnknown;
    return self;
}

- (OFDate *)date
{
    struct tm time;
    uiDateTimePickerTime(uiDateTimePicker(_control), &time);

    return [OFDate dateWithTimeIntervalSince1970: mktime(&time)];
}

- (void)setDate: (OFDate *)date
{
    time_t ti = date.timeIntervalSince1970;
    const struct tm *time = localtime(&ti);
    if (time == NULL) @throw [OFInitializationFailedException exception];

    uiDateTimePickerSetTime(uiDateTimePicker(_control), time);
}

@end
