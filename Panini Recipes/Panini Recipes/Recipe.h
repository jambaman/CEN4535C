//
//  Recipe.h
//  Panini Recipes
//
//  Created by stephen jamba on 10/6/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject
@property (nonatomic, strong) NSString* recipeName;
@property (nonatomic, strong) NSArray* ingredients;
@property (nonatomic, strong) NSString* instructions;
@property (nonatomic, strong) NSString* cookTime;
@property (nonatomic, strong) NSString* imageFile;


//-(id)initWithName:(NSString*)recipeName ingredients:(NSString*)ingredients instructions:(NSString*)instructions cookTime:(NSString*)cookTime;

@end
