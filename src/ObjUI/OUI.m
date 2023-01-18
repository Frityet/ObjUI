#include "OUI.h"

#import <ObjFW/OFInitializationFailedException.h>
#import <ObjFW/OFString.h>

#include <ui.h>

static int onShouldQuitWrapper(void *data)
{
    bool (^onShouldQuit)() = (__bridge bool (^)())data;
    return onShouldQuit();
}

@implementation OUI

+ (void)oui
{
    const char *err = uiInit(&(uiInitOptions){0});

    if (err != NULL) {
        @throw [OFInitializationFailedException exception];
    }

    atexit(uiUninit);
}

+ (void)main
{
    uiMain();
}

+ (void)quit
{
    uiQuit();
}

+ (void)setOnShouldQuit:(bool (^)(void))onShouldQuit
{ uiOnShouldQuit(&onShouldQuitWrapper, (__bridge void *)onShouldQuit); }

@end
