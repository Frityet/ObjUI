#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

#pragma clang assume_nonnull begin

@interface OUIComboBox : OUIControl<OUIInput> {
    @private OFMutableArray<OFString * > *_items;
}

@property(nonatomic, setter=setSelectedIndex:, getter=getSelectedIndex) int selectedIndex;
@property(nonatomic, setter=setItems:) OFArray<OFString *> *items;

@property(readonly) int itemCount;
@property(readonly) OFString *_Nullable selected;

+ (instancetype)comboBoxWithItems: (OFArray<OFString *> *)items;

- (instancetype)initWithItems: (OFArray<OFString *> *)items;

- (void)append: (OFString *)item;
- (void)insert: (OFString *)item at: (int)index;
- (void)delete: (int)index;

- (void)clear;

@end

#pragma clang assume_nonnull end
