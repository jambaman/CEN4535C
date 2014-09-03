//
//  ViewController.m
//  Temp Converter
//
//  Created by lori geronimo on 9/1/14.
//  Copyright (c) 2014 Steve Jamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tempF;
@synthesize tempC;

- (void)viewDidLoad
{
    [super viewDidLoad];
	tempF.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender {
    NSString *inText = [tempF text];
    float tempFValue = [inText floatValue];
    float tempCValue = (tempFValue - 32)*5/9;
    NSString *outText = [NSString stringWithFormat:@"%3.2f", tempCValue];
    [tempC setText:outText];
    [tempF resignFirstResponder];
    
}
@end
