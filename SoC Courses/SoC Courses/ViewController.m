//
//  ViewController.m
//  SoC Courses
//
//  Created by stephen jamba on 9/16/14.
//  Copyright (c) 2014 stephen jamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize cap, cen, cis, cop, capCourses, cenCourses, cisCourses, copCourses;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *myCapFile = [[NSBundle mainBundle]
                        pathForResource:@"CAP_course" ofType:@"plist"];
    cap = [[NSDictionary alloc]
                  initWithContentsOfFile:myCapFile];
    capCourses = [cap allKeys ];
    
    NSString *myCenFile = [[NSBundle mainBundle]
                        pathForResource:@"CEN_course" ofType:@"plist"];
    cen = [[NSDictionary alloc]
           initWithContentsOfFile:myCenFile];
    cenCourses = [cen allKeys ];
    
    NSString *myCisFile = [[NSBundle mainBundle]
                        pathForResource:@"CIS_course" ofType:@"plist"];
    cis = [[NSDictionary alloc]
           initWithContentsOfFile:myCisFile];
    cisCourses = [cis allKeys ];
    
    NSString *myCopFile = [[NSBundle mainBundle]
                        pathForResource:@"COP_course" ofType:@"plist"];
    cop = [[NSDictionary alloc]
           initWithContentsOfFile:myCopFile];
    copCourses = [cop allKeys ];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [capCourses count];
    }else if(section == 1){
        return [cenCourses count];
    }else if(section == 2){
        return [cisCourses count];
    }else if(section == 3){
        return [copCourses count];
    }else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if([indexPath section] == 0)
    {
        NSString *currentCourse=[capCourses objectAtIndex:indexPath.row];
        [[cell textLabel] setText:currentCourse];
        NSString *currentInstructorName;
        currentInstructorName = [cap objectForKey:[capCourses objectAtIndex:indexPath.row]];
        [[cell detailTextLabel] setText:currentInstructorName];
    }else if([indexPath section] == 1){
        NSString *currentCourse=[cenCourses objectAtIndex:indexPath.row];
        [[cell textLabel] setText:currentCourse];
        NSString *currentInstructorName;
        currentInstructorName = [cen objectForKey:[cenCourses objectAtIndex:indexPath.row]];
        [[cell detailTextLabel] setText:currentInstructorName];
    }else if([indexPath section] == 2){
        NSString *currentCourse=[cisCourses objectAtIndex:indexPath.row];
        [[cell textLabel] setText:currentCourse];
        NSString *currentInstructorName;
        currentInstructorName = [cis objectForKey:[cisCourses objectAtIndex:indexPath.row]];
        [[cell detailTextLabel] setText:currentInstructorName];
    }else if([indexPath section] == 3){
        NSString *currentCourse=[copCourses objectAtIndex:indexPath.row];
        [[cell textLabel] setText:currentCourse];
        NSString *currentInstructorName;
        currentInstructorName = [cop objectForKey:[copCourses objectAtIndex:indexPath.row]];
        [[cell detailTextLabel] setText:currentInstructorName];
    }
    cell.accessoryType =
    UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"CAP Courses";
    }else if(section == 1){
        return @"CEN Courses";
    }else if(section == 2){
        return @"CIS Courses";
    }else if(section == 3){
        return @"COP Courses";
    }else{
        return nil;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
