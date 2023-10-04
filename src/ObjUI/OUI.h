#import <ObjFW/OFObject.h>
#import <ObjFW/OFInitializationFailedException.h>

@interface OUIInitalizationFailedException : OFInitializationFailedException

@property(readonly) const char *error;

+ (instancetype)exceptionWithError: (const char *)error;
- (instancetype)initWithError: (const char *)error;

@end

@interface OUI : OFObject

+ (void) oui;
+ (void) main;
+ (void) asyncMain;
+ (void) quit;

+ (void) onShouldQuit: (bool (^)())onShouldQuit;

@end
