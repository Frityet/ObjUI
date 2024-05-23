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
    return onShouldQuit ? onShouldQuit() : 0;
}

@implementation OUIInitalizationFailedException

+ (instancetype)exceptionWithError:(OFString *)error
{ return [[self alloc] initWithError: error]; }

- (instancetype)initWithError:(OFString *)error
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

+ (void)initialize
{
    const char *err = uiInit(&(uiInitOptions){0});

    if (err != NULL)
        @throw [OFInitializationFailedException exception];
}


+ (void)main
{
    uiMain();
}

+ (void)quit
{
    uiQuit();
}

+ (void)onShouldQuit:(bool (^)(void))onShouldQuit
{ uiOnShouldQuit(&onShouldQuitWrapper, (__bridge_retained void *)onShouldQuit); }

@end
