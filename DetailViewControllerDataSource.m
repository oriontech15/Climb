//
//  DetailViewControllerDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "DetailViewControllerDataSource.h"
#import "GoalController.h"

@interface DetailViewControllerDataSource ()

@end

@implementation DetailViewControllerDataSource

#pragma mark - TableView DataSource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        DetailViewTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewTitleCell"];
        
        cell.titleLabel.text = self.goal.goalTitle;
        
        NSLog(@"title title: %@", self.goal.goalTitle);
        NSLog(@"title cellText: %@", cell.titleLabel.text);
        
        //cell.delegate = self;
        
        return cell;
    }
    
    if (indexPath.row == 1)
    {
        DetailViewDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewDateCell"];
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate: self.goal.goalDate];
        
        cell.dateLabel.text = getDate;
        
        NSLog(@"GoalDate: %@", self.goal.goalDate);
        
        NSLog(@"date: %@", getDate);
        NSLog(@"date cellText: %@", cell.dateLabel.text);
        
        return cell;
    }
    
    if (indexPath.row == 2)
    {
        DetailViewDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewDescriptionCell"];
        
        cell.descriptionTextView.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
        cell.descriptionTextView.text = self.goal.goalDescription;
        
        NSLog(@"description text: %@", self.goal.goalDescription);
        NSLog(@"description cellText: %@", cell.descriptionTextView.text);
        
        return cell;
    }
    
    else
    {
        self.subGoal = [self.goal.subGoals objectAtIndex:indexPath.row - 3];
        
        DetailViewSubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewSubGoalCell"];
        
        cell.subGoalLabel.text = self.subGoal.subGoalTitle;
        
        NSLog(@"INDEXPath: %ld", indexPath.row -3);
        NSLog(@"subgoal title: %@", self.subGoal.subGoalTitle);
        NSLog(@"subgoal cellText: %@", cell.subGoalLabel.text);
        
        //cell.delegate = self;
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 + self.goal.subGoals.count;
}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfCells = 3 + self.goal.subGoals.count;
    
    //title Row
    if (indexPath.row == 0)
    {
        return 55.0;
    }
    
    //Description Row
    else if (indexPath.row == 1)
    {
        return 120.0;
    }
    
    //subGoal Row
    else if (indexPath.row == 2)
    {
        return 44.0;
    }
    
    //addSubGoalbutton row
    else if (indexPath.row == numberOfCells - 2)
    {
        return 54.0;
    }
    
    //done button row
    else
    {
        return 55.0;
    }
}

@end
