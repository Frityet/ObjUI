#import <ObjFW/OFObject.h>
#import <ObjFW/OFInitializationFailedException.h>

#pragma clang assume_nonnull begin

@interface OUIInitalizationFailedException : OFInitializationFailedException

@property(readonly) OFString *error;

+ (instancetype)exceptionWithError: (OFString *)error;
- (instancetype)initWithError: (OFString *)error;

@end

@interface OUI : OFObject

+ (void) main;
+ (void) quit;

+ (void) onShouldQuit: (bool (^)())onShouldQuit;

@end

#pragma clang assume_nonnull end
