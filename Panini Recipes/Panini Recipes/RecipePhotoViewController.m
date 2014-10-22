//
//  RecipePhotoViewController.m
//  Panini Recipes
//
//  Created by stephen jamba on 10/8/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "RecipePhotoViewController.h"
#import "Recipe.h"
#import "DetailViewController.h"

@interface RecipePhotoViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end


#pragma mark -

@implementation RecipePhotoViewController

- (void)loadView {
    
    self.title = self.recipe.imageFile;
    
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor clearColor];
    
    self.view = self.imageView;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
     self.imageView.image= [self.recipe.imageFile valueForKey:@"image"];
}

@end

