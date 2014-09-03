//
//  ViewController.m
//  Hello World
//
//  Created by lori geronimo on 9/1/14.
//  Copyright (c) 2014 Steve Jamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize label1;

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

- (IBAction)showText:(id)sender {
    NSString *message=@"Hello World!";
    [label1 setText:message];
}


@end
