//
//  DetailViewController.m
//  Panini Recipes
//
//  Created by stephen jamba on 10/6/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize recipe;
@synthesize paniniImage;
@synthesize cookTimeLabel;
@synthesize ingredientTextView;
@synthesize instructionsTextView;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
   // if (_detailItem != newDetailItem) {
   //     _detailItem = newDetailItem;
            
        // Update the view.
    //    [self configureView];
 //   }
}

- (void)configureView
{
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = recipe.recipeName;
    self.cookTimeLabel.text = recipe.cookTime;
    self.instructionsTextView.text = recipe.instructions;
    self.paniniImage.image = [UIImage imageNamed:recipe.imageFile];
    NSMutableString *ingredient = [NSMutableString string];
    for (NSString* ingredientsText in recipe.ingredients) {
        [ingredient appendFormat:@"%@\n", ingredientsText];
}
    self.ingredientTextView.text=ingredient;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
