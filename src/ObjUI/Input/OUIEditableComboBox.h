#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

@interface OUIEditableComboBox : OUIInput

@property OFString *text;

+ (instancetype)editableComboBoxWithItems: (OFArray<OFString *> *)items;
- (instancetype)initWithItems: (OFArray<OFString *> *)items;

- (void)append: (OFString *)item;

@end
