#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFNumber.h>
#import <ObjFW/OFColor.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@protocol OUITableItemShowable @end

@interface OFString(OUITableItemShowable) @end
@interface OFNumber(OUITableItemShowable) @end
@interface OFColor(OUITableItemShowable) @end

@interface OUITableItem<OUITableItemShowable> : OFObject {

}

@end

@interface OUITable : OUIControl

@end

void test()
{

}

#pragma clang assume_nonnull end

