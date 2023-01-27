#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#import "OUIInput.h"

@interface OUICheckbox : OUIControl<OUIInput>

@property(nonatomic, setter=setText:) OFString *text;
@property(nonatomic, setter=setChecked:) bool checked;

+ (instancetype)checkboxWithLabel: (OFString *)text;

- (instancetype)initWithLabel: (OFString *)text;

@end
