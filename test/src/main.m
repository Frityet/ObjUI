#import <ObjFW/OFStdIOStream.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFMutableArray.h>
@interface NSArray : OFArray @end

#import <ObjUI/OUI.h>
#import <ObjUI/OUIDialog.h>
#import <ObjUI/OUILabel.h>
#import <ObjUI/OUIMenu.h>
#import <ObjUI/Input/OUIButton.h>
#import <ObjUI/Input/OUICheckbox.h>
#import <ObjUI/Input/OUIEntry.h>
#import <ObjUI/Input/OUIComboBox.h>
#import <ObjUI/Input/OUIEditableComboBox.h>
#import <ObjUI/Input/OUISpinbox.h>
#import <ObjUI/Input/OUIDateTimePicker.h>
#import <ObjUI/Input/OUIColourButton.h>
#import <ObjUI/Container/OUIWindow.h>
#import <ObjUI/Container/OUIForm.h>
#import <ObjUI/Container/OUIBox.h>
#import <ObjUI/Container/OUITab.h>
#import <ObjUI/Container/OUIBox.h>
#import <ObjUI/Container/OUIGroup.h>

int main()
{
	//hehe wee wee
	[OUI oui];

	OUIWindow *window = [OUIWindow windowWithTitle: @"" width: 256 height: 128 hasMenubar: false];
	window.margined = true;
	window.onClosing = ^ {
		[OUI quit];
		return 0;
	};



	[window show];
	[OUI main];
	return 0;
}
