#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>

#include <ui.h>

#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUIEditableComboBox : OUIInput

@property OFString *text;

+ (instancetype)editableComboBoxWithItems: (OFArray<OFString *> *)items;
- (instancetype)initWithItems: (OFArray<OFString *> *)items;

- (void)append: (OFString *)item;

@end

#pragma clang assume_nonnull end
