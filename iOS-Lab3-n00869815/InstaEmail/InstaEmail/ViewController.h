//
//  ViewController.h
//  InstaEmail
//
//  Created by stephen jamba on 9/15/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


- (IBAction)sendMail:(id)sender;

@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (nonatomic, strong)NSString* pickedMood;
@property (nonatomic, strong)NSString* pickedActivity;
@property (nonatomic, strong) NSArray* activities;
@property(nonatomic, strong) NSArray *mood;

@end
