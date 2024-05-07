#import <ObjFW/OFString.h>
#import <ObjFW/OFArray.h>
#import <ObjFW/OFApplication.h>
#import <ObjFW/OFKeyValueCoding.h>
#import <ObjFW/OFDictionary.h>

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

#define nullable _Nullable
#define nonnull _Nonnull
#define auto __auto_type

#pragma clang assume_nonnull begin

static OUIBox *basicControls()
{
    auto vbox = [OUIBox verticalBox];
    vbox.padded = true;
    {
        auto hbox = [OUIBox horizontalBox];
        hbox.padded = true;
        {
            [hbox appendControl: [OUIButton buttonWithLabel: @"Button"]];
            [hbox appendControl: [OUICheckbox checkboxWithLabel: @"Checkbox"]];
        }
        [vbox appendControl: hbox];
        [vbox appendControl: [OUILabel labelWithText: @"This is a label.\nLabels can span multiple lines."]];
        [vbox appendControl: [OUISeperator horizontalSeperator]];

        auto group = [OUIGroup groupWithLabel: @"Entries"];
        group.margined = true;
        {
            auto entryForm = [OUIForm form];
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

static OUIBox *inputControls(OUIWindow *window)
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

        [vbox appendControl: [OUIComboBox comboBoxWithItems: @[@"Item 1", @"Item 2", @"Item 3"]]];
        [vbox appendControl: [OUIEditableComboBox editableComboBoxWithItems: @[@"Item 1", @"Item 2", @"Item 3"]]];
        [vbox appendControl: [OUISpinbox spinbox]];

        OUIButton *openFileButton = [OUIButton buttonWithLabel: @"Open File"];
        openFileButton.onChanged = ^(OUIControl *control) {
            auto button = (OUIButton *)control;
            button.text = [OUIDialog openFileDialogForWindow: window];
        };
        [vbox appendControl: openFileButton];

        [hbox appendControl: vbox];
    }
    return hbox;
}
@interface App : OFObject<OFApplicationDelegate> @end

@implementation App

- (void)applicationDidFinishLaunching: _
{
    OUIWindow *window = [OUIWindow windowWithTitle: @"Oui - test" width: 256 height: 128 hasMenubar: false];
    window.margined = true;
    window.onClosing = ^(OUIWindow *window) {
        [window close];
        [OUI quit];
        [OFApplication terminate];
        return 0;
    };

    OUITab *tab = [OUITab tab];
    window.child = tab;

    [tab appendControl: basicControls() label: @"Basic Controls"];
    [tab setMargined: true atIndex: 0];

    [tab appendControl: inputControls(window) label: @"Input Controls"];
    [tab setMargined: true atIndex: 1];

    [window show];
    // [OUI asyncMain];
    [OUI main];

}

@end


#pragma clang assume_nonnull end

OF_APPLICATION_DELEGATE(App)

