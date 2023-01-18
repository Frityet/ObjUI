#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>

#include <ui.h>

#import <ObjUI/OUIControl.h>
#import "OUIInput.h"

typedef struct {
    OFString *family;
    int size;
    uiTextWeight weight;
    uiTextItalic italic;
    uiTextStretch stretch;
} OUIFont;

@interface OUIFontButton : OUIControl<OUIInput>

@property (nonatomic, readonly) OUIFont font;

+ (instancetype)fontButton;

@end
