#import <ObjFW/OFStdIOStream.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
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

static OUIBox *makeBasicControlsPage()
{
    OUIBox *vbox = [OUIBox verticalBox];
    vbox.padded = true;

    OUIBox *hbox = [OUIBox horizontalBox];
    hbox.padded = true;

    [vbox append: hbox stretchy: false];
    [hbox append: [OUIButton buttonWithText: @"Button"] stretchy: false];
    [hbox append: [OUICheckbox checkboxWithText: @"Checkbox"] stretchy: false];
    [vbox append: [OUILabel labelWithText: @"This is a label.\nLabels can span multiple lines."] stretchy: false];
	[vbox append: [OUIComboBox comboBoxWithItems: @[ @"Item 1", @"Item 2", @"Item 3" ]] stretchy: false];

    // [vbox append: [OUIHorizontalSeparator horizontalSeparator] stretchy: false];

    OUIGroup *group = [OUIGroup groupWithTitle: @"Entries"];
    group.margined = true;
    [vbox append: group stretchy: true];

    OUIForm *entryForm = [OUIForm form];
    entryForm.padded = true;

    [group setChild: entryForm];

    [entryForm append: [OUIEntry entry] label: @"Entry" stretchy: false];
    [entryForm append: [OUIEntry passwordEntry] label: @"Password Entry" stretchy: false];
    [entryForm append: [OUIEntry searchEntry] label: @"Search Entry" stretchy: false];
	[entryForm append: [OUIEntry multilineEntry] label: @"Multiline Entry" stretchy: true];
	[entryForm append: [OUIEntry multilineNonWrappingEntry] label: @"Multiline Entry No Wrap" stretchy: true];

	return vbox;
}

//Control gallery
int main()
{
    [OUI oui];

    OUIWindow *window = [OUIWindow windowWithTitle: @"Example window" width: 100 height: 100 hasMenubar: false];
    window.onClosing = ^ {
        [OUI quit];
        return 0;
    };
    window.margined = true;

    OUITab *tab = [OUITab tab];
    window.child = tab;

    [tab append: makeBasicControlsPage() label: @"Basic Controls"];
	[tab setMargined: true at: 0];



    [window show];
    [OUI main];
    return 0;
}
