//
//  cardViewController.h
//  Tip Calculator
//
//  Created by stephen jamba on 9/8/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cardViewController : UIViewController
- (IBAction)calculateTip:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *billTotalLabel;

@property (weak, nonatomic) IBOutlet UILabel *tip10Label;
@property (weak, nonatomic) IBOutlet UILabel *tip15Label;
@property (weak, nonatomic) IBOutlet UILabel *tip20Label;
@property (weak, nonatomic) IBOutlet UILabel *total10Label;
@property (weak, nonatomic) IBOutlet UILabel *total15Label;
@property (weak, nonatomic) IBOutlet UILabel *total20Label;

@end
