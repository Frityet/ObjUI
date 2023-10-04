#include "OUIDialog.h"

#import <ObjFW/OFString.h>

#include <ui.h>

@implementation OUIDialog

+ (OFString *)openFileDialogForWindow: (OUIWindow *)parent
{
    const char *cstr = uiOpenFile(uiWindow(parent.control));
    if (cstr == NULL) return nil;

    return [OFString stringWithUTF8String: cstr];
}

+ (OFString *)saveFileDialogForWindow: (OUIWindow *)parent
{
    const char *cstr = uiSaveFile(uiWindow(parent.control));
    if (cstr == NULL) return nil;

    return [OFString stringWithUTF8String: cstr];
}

+ (OFString *)openDirectoryDialogForWindow: (OUIWindow *)parent
{
    const char *cstr = uiOpenFolder(uiWindow(parent.control));
    if (cstr == NULL) return nil;

    return [OFString stringWithUTF8String: cstr];
}

+ (void)messageBoxForWindow: (OUIWindow *)parent
                       title: (OFString *)title
                     message: (OFString *)message
{
    uiMsgBox(uiWindow(parent.control), title.UTF8String, message.UTF8String);
}

+ (void)errorBoxForWindow: (OUIWindow *)parent
                     title: (OFString *)title
                   message: (OFString *)message
{
    uiMsgBoxError(uiWindow(parent.control), title.UTF8String, message.UTF8String);
}

@end
