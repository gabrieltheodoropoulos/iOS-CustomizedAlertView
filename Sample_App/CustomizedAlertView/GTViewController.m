//
//  GTViewController.m
//  CustomizedAlertView
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//

#import "GTViewController.h"
#import "GTAlertView.h"

@interface GTViewController ()

@property (nonatomic, strong) GTAlertView *alertView;

@property (nonatomic, strong) GTAlertView *buttonLessAlertView;


-(void)hideAlertView;

@end


@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction method implementation

- (IBAction)showAlertView:(id)sender {
    self.alertView = [[GTAlertView alloc] initWithTitle:@"GTAlertView"
                                                message:@"Do you like completion handlers and blocks?"
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Yes", @"No", nil];
    
    [self.alertView showWithCompletionHandler:^(NSString *buttonTitle, NSInteger buttonIndex) {
        NSLog(@"%@ %d", buttonTitle, buttonIndex);
    }];
}


- (IBAction)showAlertViewSingleMessage:(id)sender {
    [GTAlertView showAlertViewWithTitle:@"GTAlertView"
                             andMessage:@"This is a single message using a class method."
                     andDoneButtonTitle:@"Done"];
}


- (IBAction)showButtonlessAlertView:(id)sender {
    self.buttonLessAlertView = [[GTAlertView alloc] init];
    [self.buttonLessAlertView showButtonLessAlertViewWithTitle:@"GTAlertView"
                                                    andMessage:[NSString stringWithFormat:@"\nPlease wait...\n\nThis alert will go away in a while..."]];
    
    [self performSelector:@selector(hideAlertView) withObject:nil afterDelay:3.0];
}


#pragma mark - Private method implementation

-(void)hideAlertView{
    [self.buttonLessAlertView hideButtonLessAlertView];
}

@end
