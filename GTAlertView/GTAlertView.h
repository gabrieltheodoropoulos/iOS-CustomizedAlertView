//
//  GTAlertView.h
//  CustomizedAlertView
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//

#import <Foundation/Foundation.h>

@interface GTAlertView : NSObject <UIAlertViewDelegate>

-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)showWithCompletionHandler:(void(^)(NSString *buttonTitle, NSInteger buttonIndex))handler;

-(void)showButtonLessAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message;

-(void)hideButtonLessAlertView;


+(void)showAlertViewWithTitle:(NSString *)title
                   andMessage:(NSString *)message
           andDoneButtonTitle:(NSString *)doneButtonTitle;

@end
