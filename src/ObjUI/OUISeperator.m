#include "OUISeperator.h"

@implementation OUISeperator

+ (instancetype)horizontalSeperator
{ return [[self alloc] initWithOrientation: 0]; }

+ (instancetype)verticalSeperator
{ return [[self alloc] initWithOrientation: 1]; }

- (instancetype)initWithOrientation: (bool)vertical
{
    if (!(self = [super init])) return nil;
    _control = uiControl(uiNewHorizontalSeparator());
    return self;
}

@end
