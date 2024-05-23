#include "OUIProgressBar.h"

@implementation OUIProgressBar

+ (instancetype)progressBar
{ return [[self alloc] init];}

- (instancetype)init
{ return [super initFromControl: uiControl(uiNewProgressBar())]; }

- (int)progress
{ return uiProgressBarValue(uiProgressBar(_control)); }

- (void)setProgress: (int)progress
{ uiProgressBarSetValue(uiProgressBar(_control), progress); }


@end
