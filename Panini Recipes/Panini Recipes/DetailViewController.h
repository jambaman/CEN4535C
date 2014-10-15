//
//  DetailViewController.h
//  Panini Recipes
//
//  Created by stephen jamba on 10/6/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "MasterViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *paniniImage;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *cookTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *instructionsTextView;
@property (weak, nonatomic) IBOutlet UITextView *ingredientTextView;

@property (strong,nonatomic) Recipe *recipe;


@end

