//
//  ViewController.m
//  Quiz App
//
//  Created by stephen jamba on 9/10/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize questionField;
@synthesize answerField;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    questions =[[NSMutableArray alloc] init];
    answers = [[NSMutableArray alloc]init];
    
    [questions addObject:@"What is 12 modulo 7?"];
    [answers addObject:@"5"];
    
    [questions addObject:@"What is the capital of Florida?"];
    [answers addObject:@"Tallahasse"];
    
    [questions addObject:@"What does Sheldon Copper study?"];
    [answers addObject:@"String Theory"];
    [questions addObject:@"What were George Washington's fake teeth made of?"];
    [answers addObject:@"Wood"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    currentQuestionIndex ++;
    if (currentQuestionIndex == [questions count]) {
        currentQuestionIndex = 0;
    }
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    [questionField setText: question];
    [answerField setText:@"???"];
}

- (IBAction)showAnswer:(id)sender {
   
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    [answerField setText:answer];
}
@end
