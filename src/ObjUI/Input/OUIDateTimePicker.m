#include "OUIDateTimePicker.h"

#include <time.h>

#import <ObjFW/OFInvalidArgumentException.h>
#import <ObjFW/OFInitializationFailedException.h>

static void onChangedWrapper(uiDateTimePicker *picker, void *data)
{
    OUIDateTimePicker *self = (__bridge OUIDateTimePicker *)data;
    self.onChanged(self);
}

@implementation OUIDateTimePicker

@synthesize onChanged;

+ (instancetype)datePicker
{ return [[self alloc] initWithType: OUIDateTimePickerDate];}

+ (instancetype)timePicker
{ return [[self alloc] initWithType: OUIDateTimePickerTime];}

+ (instancetype)dateTimePicker
{ return [[self alloc] initWithType: OUIDateTimePickerDateTime];}

- (instancetype)initWithType: (enum OUIDateTimePickerType)type
{
    if (!(self = [super init])) return nil;

    _type = type;

    switch (type) {
        case OUIDateTimePickerDate:
            _control = uiControl(uiNewDatePicker());
            break;
        case OUIDateTimePickerTime:
            _control = uiControl(uiNewTimePicker());
            break;

        case OUIDateTimePickerDateTime:
            _control = uiControl(uiNewDateTimePicker());
            break;

        default:
            @throw [OFInvalidArgumentException exception];
    }

    return self;
}

- (void)setDate: (OFDate *)date
{
    time_t ti = date.timeIntervalSince1970;
    const struct tm *time = localtime(&ti);
    if (time == NULL) @throw [OFInitializationFailedException exception];

    uiDateTimePickerSetTime(uiDateTimePicker(_control), time);
}

- (OFDate *)getDate
{
    struct tm time;
    uiDateTimePickerTime(uiDateTimePicker(_control), &time);

    return [OFDate dateWithTimeIntervalSince1970: mktime(&time)];
}

- (void)setOnChanged: (void (^)(OUIControl *))fn
{
    self->onChanged = fn;
    uiDateTimePickerOnChanged(uiDateTimePicker(_control), onChangedWrapper, (__bridge_retained void *)self);
}

@end
