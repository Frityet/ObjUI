#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUIRadioButtons : OUIInput

+ (instancetype)radioButtonsWithLabels: (OFArray<OFString *> *)items;

- (instancetype)initWithLabels: (OFArray<OFString *> *)items;

- (void)append: (OFString *)item;

@end

#pragma clang assume_nonnull end
