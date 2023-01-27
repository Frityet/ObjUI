#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFNotImplementedException.h>
#import <ObjUI/OUIControl.h>

#include <ui.h>

@interface OUIBox : OUIControl

@property(nonatomic, setter=setPadded:) bool padded;
@property(readonly) bool vertical;
@property(readonly) int childCount;

+ (instancetype)verticalBox;
+ (instancetype)horizontalBox;

- (instancetype)initWithVerticalOrientation: (bool)vertical;

- (void)appendControl: (OUIControl *)control stretchy: (bool)stretchy;
- (void)appendControl: (OUIControl *)control;

- (void)delete: (int)index;

@end
