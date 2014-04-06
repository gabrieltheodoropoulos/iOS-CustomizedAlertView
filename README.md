## Description ##

The **GTAlertView** class for iOS, provides a way for using the UIAlertView with a completion handler block, instead of delegate methods. With it, initialiazing and showing the alert view, as well as handling the tapped buttons are implemented all together in one place. Therefore, there is no more need to adopt the UIAlertViewDelegate protocol and implement delegate methods. Further than that, two more features are provided: To show a single message with a one button using a class method (no object initialization required), and a convenient way to present a buttonless alert view. 


## Usage ##

First of all, the GTAlertView class must be imported to the class that is about to be used:

    #import "GTAlertView.h"


To show a normal alert view using a completion handler:

1. Declare either a public or a private object of the GTAlertView class.
2. Initialize it using the <code>initWithTitle:message:cancelButtonTitle:otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION</code> init method of the GTAlertView class.
3. Show it and handle the tapped buttons using the <code>showWithCompletionHandler:</code> method.

The completion handler returns the tapped button title and index.


To show a single message with one button only using the provided class method, just call the <code>showAlertViewWithTitle:andMessage:andDoneButtonTitle:</code> as follows:

    [GTAlertView showAlertViewWithTitle:@"ALERT_TITLE"  andMessage:@"ALERT_MESSAGE"  andDoneButtonTitle:@"ALERT_BUTTON_TITLE"];


Finally, to present a buttonless alert view:

1. Declare either a public or a private object of the GTAlertView class.
2. Initialize it using the normal init method (<code>self.alertObject = [[GTAlertView alloc] init]</code>).
3. Call the <code>showButtonLessAlertViewWithTitle:andMessage:</code> method to show it.
4. To dismiss it, just call the <code>hideButtonLessAlertView</code> method.


See the sample app provided for examples.


## Notes ##

1. In the GTAlertView class, only the <code>alertView:clickedButtonAtIndex:</code> delegate method is implemented.

2. Currently, only single text alert views can be displayed using this class. Support for other styles (such as textfield or login alert views) will be added to a future update.