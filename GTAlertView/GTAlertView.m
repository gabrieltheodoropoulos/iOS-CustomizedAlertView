//
//  GTAlertView.m
//  CustomizedAlertView
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//


#import "GTAlertView.h"

@interface GTAlertView()

@property (nonatomic, strong) UIAlertView *alertView;

@property (nonatomic, strong) void (^completionHandler)(NSString *, NSInteger);

@end


@implementation GTAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.alertView = nil;
    }
    return self;
}


-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION{
    
    self = [super init];
    
    if (self) {
        // Initialize the alert view without providing any buttons yet.
        _alertView = [[UIAlertView alloc] initWithTitle:title
                                                message:message
                                               delegate:self
                                      cancelButtonTitle:cancelButtonTitle
                                      otherButtonTitles:nil];
        
        
        // Add the button(s) to the alert view using the next code segment.
        // 1. Declare a pointer which will point to the first button title.
        va_list buttonPointer;
        // 2. Point to the first item of the list.
        va_start(buttonPointer, otherButtonTitles);
        // 3. Get the first button title.
        NSString *currentButtonTitle = otherButtonTitles;
        // 4. Make a loop to access all button titles.
        while (currentButtonTitle != nil) {
            // 5. Add the current button title to the alert view.
            [_alertView addButtonWithTitle:currentButtonTitle];
            // 6. Get the next item of the button titles list.
            currentButtonTitle = va_arg(buttonPointer, NSString *);
        }
        // 7. Release the reserved memory.
        va_end(buttonPointer);
        
    }
    
    return self;
}


#pragma mark - Public method implementation


-(void)showWithCompletionHandler:(void (^)(NSString *, NSInteger))handler{
    // Keep the completion handler.
    _completionHandler = handler;
    
    // Show the alert view.
    [_alertView show];
}



-(void)showButtonLessAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message{
    _alertView = [[UIAlertView alloc] initWithTitle:title
                                            message:message
                                           delegate:self
                                  cancelButtonTitle:nil
                                  otherButtonTitles:nil];
    [_alertView show];
    
}


-(void)hideButtonLessAlertView{
    if (_alertView != nil) {
        [_alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
}


+(void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message andDoneButtonTitle:(NSString *)doneButtonTitle{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:doneButtonTitle, nil];
    [alert show];
}



#pragma mark - UIAlertView Delegate method implementation

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // When this delegate method is called by after a button has been clicked, then just
    // simply call the completion handler and provide the necessary parameter values.
    _completionHandler([_alertView buttonTitleAtIndex:buttonIndex], buttonIndex);
}


@end
