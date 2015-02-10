//
//  ViewController.m
//  DatePicker
//
//  Created by Tim Leland on 2/9/15.
//  Copyright (c) 2015 Tim Leland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _toolbar.hidden = true;
    _datePicker.hidden = true;
    
    //Needed for textFieldShouldBeginEditing
    [_textField setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldClicked:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yy hh:mm a"];
    _textField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: _datePicker.date]];
    _datePicker.hidden = false;
    _toolbar.hidden = false;
}

- (IBAction)datePickerChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yy hh:mm a"];
    _textField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate: _datePicker.date]];
}

- (IBAction)closeDatePicker:(id)sender {
    _datePicker.hidden = true;
    _toolbar.hidden = true;
}

//Needed to prevent keyboard from opening
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}

@end
