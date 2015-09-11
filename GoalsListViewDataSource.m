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
        cell.textLabel.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];

        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:self.goal.goalDate];

        cell.detailTextLabel.text = getDate;
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];
    }
    
    else
    {
        cell.textLabel.text = @"NO TITLE";
        cell.textLabel.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];
        
        self.goal.goalDate = self.datePickerCell.goalDatePicker.date;
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:self.goal.goalDate];
        
        cell.detailTextLabel.text = getDate;
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GoalController sharedInstance].goals.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
