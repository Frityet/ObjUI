#include "OUIProgressBar.h"

@implementation OUIProgressBar

+ (instancetype)progressBar
{ return [[self alloc] init];}

- (instancetype)init
{
    if (!(self = [super init])) return nil;
    _control = uiControl(uiNewProgressBar());
    return self;
}

- (void)setProgress: (int)progress
{ uiProgressBarSetValue(uiProgressBar(_control), progress); }

- (int)getProgress
{ return uiProgressBarValue(uiProgressBar(_control)); }

@end
