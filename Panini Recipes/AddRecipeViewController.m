//
//  AddRecipeViewController.m
//  Panini Recipes
//
//  Created by stephen jamba on 10/7/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "AddRecipeViewController.h"

@interface AddRecipeViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddRecipeViewController

-(void)unwindSegue
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
- (IBAction)saveButton:(id)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.addRecipeNameTextfield becomeFirstResponder];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onCancelClick:(id)sender
{
    
    [self unwindSegue];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender !=self.saveButton) return;

    if (self.addRecipeNameTextfield.text.length>0 && self.addIngredientsTextfield.text.length>0){
    
    self.addRecipe = [[Recipe alloc]init];
    self.addRecipe.recipeName = self.addRecipeNameTextfield.text;
    self.addRecipe.cookTime=self.addCookTimeTextfield.text;
    self.addRecipe.instructions=self.addInstructionsTextfield.text;
    self.addRecipe.imageFile=@"images/classic.jpg";
    NSString*ingredientString = self.addIngredientsTextfield.text;
    NSArray*subStrings=  [ingredientString componentsSeparatedByString:@" "];
        self.addRecipe.ingredients=subStrings;
    
    }

}

@end
