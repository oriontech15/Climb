//
//  AddGoalViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalTitleViewDataSource.h"
#import "GoalController.h"
#import "SubGoal.h"

@interface GoalTitleViewDataSource () <GoalTitleTableViewCellTextFieldDelegate, SubGoalTableViewCellDelegate, DescriptionTableViewCellDelegate, addSubGoalTableViewCellDelegate, saveChangesButtonTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GoalTitleViewDataSource

#pragma mark - TableView DataSource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0)
    {
        AddHeaderGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalTitleCell"];
        
        cell.delegate = self;
        
        [[GoalController sharedInstance].cells addObject:cell];

        return cell;
    }
    
    if (indexPath.row == 1)
    {
        DescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell"];
        
        cell.delegate = self;
        
        [[GoalController sharedInstance].cells addObject:cell];

        return cell;
    }

    if (indexPath.row == 2 + self.goal.subGoals.count)
    {
        AddSubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addSubGoalCell"];
        
        cell.delegate = self;
        
        [[GoalController sharedInstance].cells addObject:cell];

        return cell;
    }
    
    if (indexPath.row == 3 + self.goal.subGoals.count)
    {
        DatePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalDateCell"];
        
        //cell.delegate = self;
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        NSString *getDate = [dateGoalFormat stringFromDate:cell.goalDatePicker.date];
        
        cell.dateViewLabel.text = getDate;
        
        [[GoalController sharedInstance].cells addObject:cell];

        return cell;
    }
    
    if (indexPath.row == 4 + self.goal.subGoals.count)
    {
        SaveChangesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doneCell"];
        
        cell.delegate = self;
        
        return cell;
    }
    
    else
    {
        SubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subGoalCell"];
        
        cell.delegate = self;
        
        [[GoalController sharedInstance].cells addObject:cell];
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5 + self.goal.subGoals.count;
}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfCells = 5 + self.goal.subGoals.count;
    
    //title Row
    if (indexPath.row == 0)
    {
        return 55.0;
    }
    
    //Description Row
    else if (indexPath.row == 1)
    {
        return 123.0;
    }
    
    //subGoal Row
    else if (indexPath.row > 1 && indexPath.row < numberOfCells - 3)
    {
        return 55.0;
    }
    
    //addSubGoalbutton row
    else if (indexPath.row == numberOfCells - 3)
    {
        return 55.0;
    }
    
    //date picker row
    else if (indexPath.row == numberOfCells - 2)
    {
        return 240.0;
    }
    
    //done button row
    else
    {
        return 55.0;
    }
}

#pragma mark - CustomCellDelegateMethods

//Implements the delegate method for the goalTitleCell
- (void)goalTitleTextFieldUpdated:(AddHeaderGoalTableViewCell *)goaltitleCell
{
    if (!self.goal)
    {
        self.goal = [[GoalController sharedInstance] createGoal];
    }
    
    self.goal.goalTitle = goaltitleCell.goalTitleTextField.text;
    
    NSLog(@"goaltitle: %@", self.goal.goalTitle);
}

//Implements the delegate method for the subGoalCell
-(void)subGoalTextFieldUpdated:(SubGoalTableViewCell *)subGoalCell
{
    if (!self.subGoal) {
        self.subGoal = [[GoalController sharedInstance] createSubGoal];
    }
    
    self.subGoal.subGoalTitle = subGoalCell.subGoalTextField.text;
    
    NSLog(@"subGoalTitle: %@", self.subGoal.subGoalTitle);
}

//Implements the delegate method for the descriptionCell
-(void)descriptionTextViewUpdated:(DescriptionTableViewCell *)descriptionCell
{
    if (!self.goal)
    {
        self.goal = [[GoalController sharedInstance] createGoal];
    }
    
    self.goal.goalDescription = descriptionCell.descriptionTextView.text;
    
    NSLog(@"Description: %@", self.goal.goalDescription);
}

-(void)addSubGoalCellToTableView
{
    if (!self.goal)
    {
        self.goal = [[GoalController sharedInstance] createGoal];
    }

    SubGoal *newSubgoal = [[GoalController sharedInstance] createSubGoal];
    newSubgoal.goal = self.goal;
    
    [self.tableView reloadData];
}

-(void)dateFromDatePickerUpdated:(DatePickerTableViewCell *)datePickerCell
{
    if (!self.goal) {
        self.goal = [[GoalController sharedInstance] createGoal];
    }
    
    self.goal.goalDate = datePickerCell.goalDatePicker.date;
    
    NSLog(@"Date: %@", self.goal.goalDate);
}

-(void)saveChangesButtonTappedToSaveChanges
{
    if (!self.goal)
    {
        self.goal = [[GoalController sharedInstance] createGoal];
    }
    
    [[GoalController sharedInstance] save];
}

#pragma mark - Editing The TableView

//Delete SubGoal Cells
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        if (indexPath.row == self.goal.subGoals.count)
//        //add code here for when you hit delete
//        
//        //1. update the model
//        SubGoal *subGoal = [GoalController sharedInstance].cells[indexPath.row];
//        [[GoalController sharedInstance] removeSubGoal:subGoal];
//        [[GoalController sharedInstance] save];
//        //2. reload the tableview or call one of the deleteRow methods
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//}

@end
