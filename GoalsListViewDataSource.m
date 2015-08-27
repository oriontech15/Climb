//
//  GoalsListViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalsListViewDataSource.h"
#import "Goal.h"
#import "GoalController.h"
#import "DatePickerTableViewCell.h"

@interface GoalsListViewDataSource ()

@property (nonatomic) DatePickerTableViewCell *datePickerCell;
@property (nonatomic, strong) NSDate *date;

@end

@implementation GoalsListViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalsCell"];
    
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"goalsCell"];
    
    self.goal = [GoalController sharedInstance].goals[indexPath.row];
    NSLog(@"goals: %@", [GoalController sharedInstance].goals[indexPath.row]);
    
    if (![self.goal.goalTitle isEqualToString:@""])
    {
        NSLog(@"goalTitle: %@", self.goal.goalTitle);
        
        cell.textLabel.text = self.goal.goalTitle;
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:self.goal.goalDate];

        cell.detailTextLabel.text = getDate;
        
    }
    
    else
    {
        cell.textLabel.text = @"NO TITLE";
        
        self.goal.goalDate = self.datePickerCell.goalDatePicker.date;
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:self.goal.goalDate];
        
        cell.detailTextLabel.text = getDate;
    }

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GoalController sharedInstance].goals.count;
}

//Method for deleting goals from the goalsListTableView
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        //1. update the model
        Goal *goal = [GoalController sharedInstance].goals[indexPath.row];
        [[GoalController sharedInstance] removeGoal:goal];
        [[GoalController sharedInstance] save];
        //2. reload the tableview or call one of the deleteRow methods
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
