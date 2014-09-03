//
//  ViewController.h
//  Temp Converter
//
//  Created by lori geronimo on 9/1/14.
//  Copyright (c) 2014 Steve Jamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)convert:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tempF;
@property (weak, nonatomic) IBOutlet UITextField *tempC;

@end
