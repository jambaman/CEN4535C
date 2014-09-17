//
//  cardViewController.m
//  Tip Calculator
//
//  Created by stephen jamba on 9/8/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "cardViewController.h"

@interface cardViewController ()

@end

@implementation cardViewController
@synthesize billTotalLabel;
@synthesize tip10Label;
@synthesize tip15Label;
@synthesize tip20Label;
@synthesize total10Label;
@synthesize total15Label;
@synthesize total20Label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	billTotalLabel.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTip:(id)sender
{
    NSString *billTotalText = billTotalLabel.text;
    float billTotal = [billTotalText floatValue];
    
    if (billTotal > 0)
    {
        for (float i=.05; i<=.2; i+=.01)
        {
            if (i<.1) {
               NSString *tip=[NSString stringWithFormat:@"%.02f",billTotal*.1];
                [tip10Label setText:tip];
                NSString *total=[NSString stringWithFormat:@"%.02f", billTotal+[tip floatValue]];
                [total10Label setText:total];
            } else if (i<.15){
                NSString *tip=[NSString stringWithFormat:@"%.02f",billTotal*.15];
                [tip15Label setText:tip];
                NSString *total=[NSString stringWithFormat:@"%.02f", billTotal + [tip floatValue]];
                [total15Label setText:total];
            }else {
                NSString *tip=[NSString stringWithFormat:@"%.02f",billTotal*.2];
                [tip20Label setText:tip];
                NSString *total=[NSString stringWithFormat:@"%.02f", billTotal+[tip floatValue] ];
                [total20Label setText:total];
            }

        }
        
    }
    [billTotalLabel resignFirstResponder];
}
@end
