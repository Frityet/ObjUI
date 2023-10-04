#import <ObjFW/OFObject.h>
#import <ObjFW/OFFile.h>

#import <ObjUI/Container/OUIWindow.h>

@interface OUIDialog : OFObject


+ (OFString *)openFileDialogForWindow: (OUIWindow *)parent;
+ (OFString *)saveFileDialogForWindow: (OUIWindow *)parent;

+ (OFString *)openDirectoryDialogForWindow: (OUIWindow *)parent;

+ (void)messageBoxForWindow: (OUIWindow *)parent
                      title: (OFString *)title
                    message: (OFString *)message;

+ (void)errorBoxForWindow: (OUIWindow *)parent
                    title: (OFString *)title
                  message: (OFString *)message;

@end

