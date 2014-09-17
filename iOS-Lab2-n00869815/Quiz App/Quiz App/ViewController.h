//
//  ViewController.h
//  Quiz App
//
//  Created by stephen jamba on 9/10/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentQuestionIndex;
    NSMutableArray *questions;
    NSMutableArray *answers;
}

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *questionField;
@property (weak, nonatomic) IBOutlet UILabel *answerField;



@end
