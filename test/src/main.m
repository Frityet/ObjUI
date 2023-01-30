#include "ui.h"
#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>

#import <ObjUI/OUI.h>
#import <ObjUI/OUIDialog.h>
#import <ObjUI/OUILabel.h>
#import <ObjUI/OUIMenu.h>
#import <ObjUI/OUISeperator.h>
#import <ObjUI/Input/OUIButton.h>
#import <ObjUI/Input/OUICheckbox.h>
#import <ObjUI/Input/OUIEntry.h>
#import <ObjUI/Input/OUIComboBox.h>
#import <ObjUI/Input/OUIEditableComboBox.h>
#import <ObjUI/Input/OUISpinbox.h>
#import <ObjUI/Input/OUIDateTimePicker.h>
#import <ObjUI/Input/OUIColourButton.h>
#import <ObjUI/Input/OUIFontButton.h>
#import <ObjUI/Container/OUIWindow.h>
#import <ObjUI/Container/OUIForm.h>
#import <ObjUI/Container/OUIBox.h>
#import <ObjUI/Container/OUITab.h>
#import <ObjUI/Container/OUIBox.h>
#import <ObjUI/Container/OUIGrid.h>
#import <ObjUI/Container/OUIGroup.h>

#define nullable __nullable
#define nonnull __nonnull

#pragma clang assume_nonnull begin

static OUIBox *basicControls()
{
    OUIBox *vbox = [OUIBox verticalBox];
    vbox.padded = true;
    {
        OUIBox *hbox = [OUIBox horizontalBox];
        hbox.padded = true;
        {
            [hbox appendControl: [OUIButton buttonWithLabel: @"Button"]];
            [hbox appendControl: [OUICheckbox checkboxWithLabel: @"Checkbox"]];
        }
        [vbox appendControl: hbox];

        [vbox appendControl: [OUILabel labelWithText: @"This is a label.\nLabels can span multiple lines."]];

        [vbox appendControl: [OUISeperator horizontalSeperator]];

        OUIGroup *group = [OUIGroup groupWithLabel: @"Entries"];
        group.margined = true;
        {
            OUIForm *entryForm = [OUIForm form];
            entryForm.padded = true;
            group.child = entryForm;

            [entryForm appendControl: [OUIEntry entry] label: @"Entry"];
            [entryForm appendControl: [OUIEntry passwordEntry] label: @"Password entry"];
            [entryForm appendControl: [OUIEntry multilineEntry] label: @"Multiline entry"];
            [entryForm appendControl: [OUIEntry multilineNonWrappingEntry] label: @"Non-wrapping multiline entry"];
        }
        [vbox appendControl: group];
    }
    return vbox;
}

static OUIBox *inputControls()
{
    OUIBox *hbox = [OUIBox horizontalBox];
    hbox.padded = true;
    {
        OUIBox *vbox = [OUIBox verticalBox];
        vbox.padded = true;
        {
            [vbox appendControl: [OUIDateTimePicker datePicker]];
            [vbox appendControl: [OUIDateTimePicker timePicker]];
            [vbox appendControl: [OUIDateTimePicker dateTimePicker]];
            [vbox appendControl: [OUIFontButton     fontButton]];
            [vbox appendControl: [OUIColourButton   colourButton]];
        }
        [hbox appendControl: vbox];

        [hbox appendControl: [OUISeperator verticalSeperator]];

        vbox = [OUIBox verticalBox];
        vbox.padded = true;
        {
            OUIGrid *grid = [OUIGrid grid];

            OUIButton *button = [OUIButton buttonWithLabel: @"  Open File  "];
            OUIEntry *entry = [OUIEntry entry];
            entry.readonly = true;
            entry.onChanged = ^(OUIControl *) {
                // [entry setText: [OUIDialog openFile: @"/" title: @"Open File"]];
            };

            // [grid appendControl: button ];

            [vbox appendControl: grid];
        }
        [hbox appendControl: vbox];
    }
    return hbox;
}

static OUIBox *tables()
{
    OUIBox *vbox = [OUIBox verticalBox];
    vbox.padded = true;
    {

    }
    return vbox;
}

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

    OUITab *tab = [OUITab tab];
    window.child = tab;

    [tab appendControl: basicControls() label: @"Basic Controls"];
    [tab setMargined: true atIndex: 0];

    [tab appendControl: inputControls() label: @"Input Controls"];
    [tab setMargined: true atIndex: 1];

    [tab appendControl: tables() label: @"Table Controls"];
    [tab setMargined: true atIndex: 2];

    [window show];
    [OUI main];
    return 0;
}

#pragma clang assume_nonnull end
