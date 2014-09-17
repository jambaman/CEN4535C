//
//  ViewController.m
//  InstaEmail
//
//  Created by stephen jamba on 9/15/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0){
        return[self.activities count];
    }
    return [self.mood count];
}
    

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0){
        return [activities objectAtIndex:row];
   }
    return [mood objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0){
        pickedActivity=[activities objectAtIndex:row];
        return;
    }
    pickedMood=[mood objectAtIndex:row];
    
}

@synthesize activities, mood, pickedActivity, pickedMood;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activities =[[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"surfing", @"shopping", @"programming",nil];
    self.mood = [[NSArray alloc] initWithObjects:@"excited", @"happy", @"angry", @"sad", @"awesome", @"confused", nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)sendMail:(id)sender {
    UIAlertView *message = [[UIAlertView alloc]
                            initWithTitle:@"InstaEmail"
                            message:[NSString stringWithFormat:@"I’m %@ and feeling %@ about it.", pickedActivity, pickedMood]
                            delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
    [message show];
}
@end
