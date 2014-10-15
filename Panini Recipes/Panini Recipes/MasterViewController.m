//
//  MasterViewController.m
//  Panini Recipes
//
//  Created by stephen jamba on 10/6/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Recipe.h"
#import "AddRecipeViewController.h"
//#import "addPaniniViewControllerTableViewController.h"

@interface MasterViewController ()


@end

@implementation MasterViewController
{
    NSMutableArray*recipes;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self->recipes = [[NSMutableArray alloc]init];

   
    
    
    Recipe *benedict= [Recipe new];
    benedict.recipeName = @"Eggs Benedict Panini";
    benedict.instructions=@"Grill the bacon first and then muffins.";
    benedict.ingredients = [NSMutableArray arrayWithObjects: @"Canadian bacon", @"English muffins", @"eggs", nil];
    benedict.cookTime = @"1 to 2 minutes";
    benedict.imageFile = @"images/benedict-panini.jpg";
    
    Recipe *frenchToast = [Recipe new];
    frenchToast.recipeName=@"French Toast Panini";
    frenchToast.instructions = @"Whisk egg and milk together.";
    frenchToast.ingredients = [NSMutableArray arrayWithObjects:@"French bread", @"eggs", @"milk", @"cream cheese", nil];
    frenchToast.cookTime = @"1 to 2 minutes";
    frenchToast.imageFile=@"images/french-toast-panini.jpeg";
    
    Recipe *mozzarella = [Recipe new];
    mozzarella.recipeName = @"Mozzarella Panini";
    mozzarella.instructions = @"Brush one side of bread with butter and place sandwich in grill.";
    mozzarella.cookTime = @"3 to 4 minutes";
    mozzarella.ingredients = [NSMutableArray arrayWithObjects: @"Sourdough bread", @"butter", @"mozzarella cheese", @"baby spinach", nil];
    mozzarella.imageFile = @"images/mozzarella-panini.jpg";
    
    Recipe *spinachLasagna = [Recipe new];
    spinachLasagna.recipeName = @"Spinach Lasagna Panini";
    spinachLasagna.instructions = @"Place rolls on a work surface and brush crusts with oil.";
    spinachLasagna.ingredients = [NSMutableArray arrayWithObjects:@"Ricotta cheese", @"baby spinach", @"dried oregano", @"ciabatta rolls", nil];
    spinachLasagna.imageFile  = @"images/spinach-lasagna-panini.png";
    spinachLasagna.cookTime = @"1 to 2 minutes";
    
    Recipe *salmonCroquette =[Recipe new];
    salmonCroquette.recipeName = @"Salmon Croquette Panini";
    salmonCroquette.ingredients = [NSMutableArray arrayWithObjects:@"Salmon croquette", @"green onion", @"minced red bell pepper", @"Italian rolls", nil];
    salmonCroquette.instructions = @"Place rolls on a work surface and brush crusts with oil.";
    salmonCroquette.cookTime = @"4 to 5 minutes";
    salmonCroquette.imageFile = @"images/salmon-panini.jpg";
    
    Recipe *chickenPesto = [Recipe new];
    chickenPesto.recipeName = @"Chicken Pesto Panini";
    chickenPesto.instructions = @"Place rolls on a work surface and brush crusts with oil.";
    chickenPesto.ingredients = [NSMutableArray arrayWithObjects:@"Italian rolls", @"butter", @"basil pesto", @"roasted chicken breast", nil];
    chickenPesto.cookTime = @"3 to 4 minutes";
    chickenPesto.imageFile = @"images/chicken-pesto-panini.jpg";
    
    recipes = [NSMutableArray arrayWithObjects:benedict, frenchToast, mozzarella, spinachLasagna, salmonCroquette,  chickenPesto, nil];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"recipeName" ascending:YES];
    [recipes sortUsingDescriptors:[NSMutableArray arrayWithObject:sort]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)insertNewObject:(id)sender {
    if (!recipes) {
        recipes = [[NSMutableArray alloc] init];
    }
    [recipes insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Segues


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *recipeViewController = segue.destinationViewController;
        recipeViewController.recipe = [recipes objectAtIndex:indexPath.row];
    }else if([[segue identifier] isEqualToString:@"addRecipe"])
    {
        
    }

}
- (IBAction)unwindToMasterView:(UIStoryboardSegue *)segue
{
    AddRecipeViewController*source=[segue sourceViewController];
    Recipe *recipe = source.addRecipe;
    if (recipe !=nil){
        [self->recipes addObject:recipe];
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"recipeName" ascending:YES];
        [recipes sortUsingDescriptors:[NSMutableArray arrayWithObject:sort]];
        [self.tableView reloadData];
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Recipe *recipeObject = recipes[indexPath.row];
    cell.textLabel.text = recipeObject.recipeName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [recipes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
