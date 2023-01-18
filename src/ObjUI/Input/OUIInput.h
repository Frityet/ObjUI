#import <ObjUI/OUIControl.h>

@protocol OUIInput

@property(nonatomic, setter=setOnChanged:) void (^onChanged)(OUIControl *sender);

@end
