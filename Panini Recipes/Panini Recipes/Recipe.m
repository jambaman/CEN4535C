//
//  Recipe.m
//  Panini Recipes
//
//  Created by stephen jamba on 10/6/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

/*-(id) initWithName:(NSString *)recipeName ingredients:(NSMutableArray *)ingredients instructions:(NSString *)instructions cookTime:(NSString *)cookTime
{
    self = [super init];
    if (self) {
    self.recipeName = recipeName;
    self.ingredients = ingredients;
    self.cookTime = cookTime;
    self.instructions = instructions;
    }
    return self;
}*/
@synthesize recipeName;
@synthesize ingredients;
@synthesize instructions;
@synthesize cookTime;
@synthesize imageFile;

@end
