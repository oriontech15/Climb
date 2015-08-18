//
//  AddGoalViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalTitleViewDataSource.h"
#import "GoalController.h"

@interface GoalTitleViewDataSource ()

@end

@implementation GoalTitleViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0)
    {
        AddHeaderGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalTitleCell"];
        
        [[GoalController sharedInstance].cells addObject:cell];

        NSLog(@"IndexPath count: %ld", (long)indexPath.row);
        return cell;
    }
    
    else if (indexPath.row == 1)
    {
        DescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell"];
        
        [[GoalController sharedInstance].cells addObject:cell];

        NSLog(@"IndexPath count: %ld", (long)indexPath.row);
        return cell;
    }

    else if (indexPath.row == 2)
    {
        SubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subGoalCell"];
        
        [[GoalController sharedInstance].cells addObject:cell];
        
//        if (cell.subGoalAddButton.enabled == YES)
//        {
//            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
//            [tableView reloadData];
//        }

        NSLog(@"IndexPath count: %ld", (long)indexPath.row);
        return cell;
    }
    
    else if (indexPath.row == 3)
    {
        DatePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalDateCell"];
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:cell.goalDatePicker.date];
        
        NSLog(@"date: %@", getDate);
        
        cell.dateViewLabel.text = getDate;
        
        [[GoalController sharedInstance].cells addObject:cell];
        
        NSLog(@"%ld", numberOfRows);
        return cell;
    }
    
    else
    {
        DoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doneCell"];
        
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row){
        case 0:
            if(indexPath.section == 0)
                return 44.0;
        case 1:
            if(indexPath.section == 0)
                return 123.0;
        case 2:
            if(indexPath.section == 0)
                return 44.0;
        case 3:
            if(indexPath.section == 0)
                return 240.0;
        default:
            return 44.0; // all other rows are 40pt high
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        //1. update the model
        //2. reload the tableview or call one of the deleteRow methods
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
