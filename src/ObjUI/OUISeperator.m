#include "OUISeperator.h"

@implementation OUISeperator

+ (instancetype)horizontalSeperator
{ return [[self alloc] initWithVerticalOrientation: false]; }

+ (instancetype)verticalSeperator
{ return [[self alloc] initWithVerticalOrientation: true]; }

- (instancetype)initWithVerticalOrientation: (bool)vertical
{
    return [super initFromControl: uiControl(vertical ? uiNewVerticalSeparator() : uiNewHorizontalSeparator())];
}

@end
