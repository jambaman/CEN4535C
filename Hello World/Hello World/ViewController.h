//
//  ViewController.h
//  Hello World
//
//  Created by Steve Jamba on 9/1/14.
//  Copyright (c) 2014 Steve Jamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)showText:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@end
