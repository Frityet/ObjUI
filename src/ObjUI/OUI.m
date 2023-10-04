#include "OUI.h"

#import <ObjFW/OFInitializationFailedException.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFTimer.h>
#import <ObjFW/OFThread.h>
#import <ObjFW/OFStdIOStream.h>

#include <ui.h>

static int onShouldQuitWrapper(void *data)
{
    bool (^onShouldQuit)() = (__bridge bool (^)())data;
    return onShouldQuit();
}

@implementation OUIInitalizationFailedException

+ (instancetype)exceptionWithError:(const char *)error
{ return [[self alloc] initWithError: error]; }

- (instancetype)initWithError:(const char *)error
{
    self = [super initWithClass: OUI.class];

    self->_error = error;

    return self;
}

- (OFString *)description
{
    return [OFString stringWithFormat: @"Could not initalize libui! Error: %s\n", _error];
}

@end

@implementation OUI

+ (void)oui
{
    const char *err = uiInit(&(uiInitOptions){0});

    if (err != NULL)
        @throw [OFInitializationFailedException exception];


    // atexit(uiUninit);
}

// + (void)initialize
// {
//     const char *err = uiInit(&(uiInitOptions){0});
//     if (err)
//         @throw [OUIInitalizationFailedException exceptionWithError: err];


//     // atexit(uiUninit);
// }

+ (void)main
{
    uiMain();
}

+ (void)asyncMain
{
    static OFThread *uiThread;
    uiThread = [OFThread threadWithBlock: ^{
        [OFStdOut writeLine: @"uiThread started"];
        uiMain();
        return (id)nil;
    }];

    [uiThread start];
}

+ (void)quit
{
    // uiQuit();
}

+ (void)onShouldQuit:(bool (^)(void))onShouldQuit
{ uiOnShouldQuit(&onShouldQuitWrapper, (__bridge_retained void *)onShouldQuit); }

@end
