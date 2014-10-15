//
//  AddRecipeViewController.h
//  Panini Recipes
//
//  Created by stephen jamba on 10/7/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "MasterViewController.h"


@interface AddRecipeViewController : UIViewController
- (IBAction)onCancelClick:(id)sender;



@property (weak, nonatomic) IBOutlet UITextField *addRecipeNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *addIngredientsTextfield;
@property (weak, nonatomic) IBOutlet UITextField *addInstructionsTextfield;
@property (weak, nonatomic) IBOutlet UITextField *addCookTimeTextfield;
@property Recipe*addRecipe;

@end
