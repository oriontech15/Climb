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
        
        return cell;
    }
    
    if (indexPath.row == 2)
    {
        DetailViewDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewDescriptionCell"];
        
        cell.descriptionTextView.text = self.goal.goalDescription;
        cell.descriptionTextView.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];
        [cell.descriptionTextView setTextAlignment:NSTextAlignmentCenter];

        return cell;
    }
    
    if (indexPath.row == 3)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"permenantSubGoalTitle"];
        
        return cell;
    }
    
    else
    {
        self.subGoal = [self.goal.subGoals objectAtIndex:indexPath.row - 4];
        
        DetailViewSubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailViewSubGoalCell"];
        
        
        cell.subGoalLabel.text = self.subGoal.subGoalTitle;
        
        //cell.delegate = self;
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4 + self.goal.subGoals.count;
}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //title Row
    if (indexPath.row == 0)
    {
        return 65.0;
    }
    
    //Date Row
    else if (indexPath.row == 1)
    {
        return 55.0;
    }
    
    //description Row
    else if (indexPath.row == 2)
    {
        return 145.0;
    }
    
    else if (indexPath.row == 3)
    {
        return 55.0;
    }
    
    //subGoal rows
    else
    {
        return 55.0;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if (indexPath.row == 0 || indexPath.row == 1)
    {
        cell.separatorInset = UIEdgeInsetsMake(0.f, cell.bounds.size.width, 0.f, 0.f);
    }
    
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3)
    {
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    
    else
    {
        cell.separatorInset = UIEdgeInsetsMake(0.f, cell.bounds.size.width, 0.f, 0.f);
    }

}

@end
