#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

@interface OUIRadioButtons: OUIControl<OUIInput>

+ (instancetype)radioButtonsWithLabels: (OFArray<OFString *> *)items;

- (instancetype)initWithLabels: (OFArray<OFString *> *)items;

- (void)append: (OFString *)item;

@end


