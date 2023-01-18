#import <ObjFW/OFStdIOStream.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>
@interface NSArray : OFArray @end

#import <ObjUI/OUI.h>
#import <ObjUI/OUIWindow.h>
#import <ObjUI/OUILabel.h>
#import <ObjUI/Input/OUIButton.h>
#import <ObjUI/Input/OUICheckbox.h>
#import <ObjUI/Input/OUIEntry.h>
#import <ObjUI/Input/OUIComboBox.h>
#import <ObjUI/OUIForm.h>
#import <ObjUI/OUIBox.h>
#import <ObjUI/OUITab.h>
#import <ObjUI/OUIBox.h>
#import <ObjUI/OUIGroup.h>

static OFMutableArray<OUIWindow *> *windows;

static OUIWindow *createWindow(OFString *title)
{
	OUIWindow *window = [OUIWindow windowWithTitle: title width: 640 height: 480 hasMenubar: false];
	window.onClosing = ^ {
		[OUI quit];
		return 0;
	};
	window.margined = true;

	OUIButton *button = [OUIButton buttonWithText: @"Click me"];
	button.onChanged = ^ {
		OUIWindow *wind = createWindow(@"New window");
		[windows addObject: wind];
		[wind show];
	};
	window.child = button;

	return window;
}

int main()
{
	[OUI oui];

	windows = [OFMutableArray array];

	OUIWindow *window = createWindow(@"Window");
	[window show];
	[OUI main];
	return 0;
}
