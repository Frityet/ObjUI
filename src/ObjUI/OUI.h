#import <ObjFW/OFObject.h>

@interface OUI : OFObject

+ (void) oui;
+ (void) main;
+ (void) quit;

+ (void) onShouldQuit: (bool (^)())onShouldQuit;

@end
