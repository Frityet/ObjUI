#include "ObjFW/macros.h"
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

static OFString *VowelCheck(OFString *str)
{
	switch (str.length > 0 ? [str characterAtIndex: 0] : str.length > 1 ? '\1' : '\0') {
	case 'a':
	case 'e':
	case 'i':
	case 'o':
	case 'u':
	case 'A':
	case 'E':
	case 'I':
	case 'O':
	case 'U':
		return @"it's a vowel";
		break;

	case 'y':
	case 'Y':
		return @"might be a vowel";
		break;

	case '\0':
		return @"no input";
		break;
	case '\1':
		return @"not a single character";
		break;

	default:
		return @"it's not a vowel";
		break;
	}
}

int main()
{
	[OUI oui];

	OUIWindow *window = [OUIWindow windowWithTitle: @"Vowel Tester" width: 256 height: 128 hasMenubar: false];
	window.margined = true;
	window.onClosing = ^ {
		[OUI quit];
		return 0;
	};

	OUIBox *box = [OUIBox verticalBox];
	box.padded = true;
	window.child = box;

	OUILabel *label = [OUILabel labelWithText: @"Is vowel: "];
	[box append: label stretchy: false];

	OUIEntry *word = [OUIEntry entry];
	word.text = @"Insert vowel here";
	word.onChanged = ^(OUIControl *ctrl) {
		OUIEntry *word = (OUIEntry *)ctrl;
		OFString *text = word.text;
		label.text = [OFString stringWithFormat: @"Is vowel: %@", VowelCheck(text)];
	};

	[box append: word stretchy: false];
	[window show];
	[OUI main];
	return 0;
}
