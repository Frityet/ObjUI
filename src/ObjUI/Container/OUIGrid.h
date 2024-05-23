#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

#pragma clang assume_nonnull begin

@interface OUIGrid : OUIControl

@property bool padded;

+ (instancetype)grid;

- (void)appendControl: (OUIControl *)control
                 left: (int)left
                  top: (int)top
                xSpan: (int)xspan
                ySpan: (int)yspan
              hExpand: (bool)hexpand
              vExpand: (bool)vexpand
               hAlign: (int)hAlign
               vAlign: (int)vAlign;

@end

#pragma clang assume_nonnull end
