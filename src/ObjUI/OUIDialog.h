#import <ObjFW/OFObject.h>
#import <ObjFW/OFFile.h>

#import <ObjUI/Container/OUIWindow.h>

@interface OUIDialog : OFObject


+ (OFString *)openFile: (OUIWindow *)parent;
+ (OFString *)saveFile: (OUIWindow *)parent;

+ (OFString *)openDirectory: (OUIWindow *)parent;

+ (void)messageBoxWithWindow: (OUIWindow *)parent
                       title: (OFString *)title
                     message: (OFString *)message;

+ (void)errorBoxWithWindow: (OUIWindow *)parent
                     title: (OFString *)title
                   message: (OFString *)message;

@end

