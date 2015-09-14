//
//  AddGoalViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "EditGoalViewDataSource.h"
#import "GoalController.h"

@interface EditGoalViewDataSource () <GoalTitleTableViewCellTextFieldDelegate, SubGoalTableViewCellDelegate, DescriptionTableViewCellDelegate, addSubGoalTableViewCellDelegate, saveChangesButtonTableViewCellDelegate, DatePickerDelegate, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDate *date;

@end

@implementation EditGoalViewDataSource

#pragma mark - TableView DataSource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        AddHeaderGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalTitleCell"];
        
        cell.goalTitleTextField.text = self.goal.goalTitle;
        
        cell.delegate = self;
        
        return cell;
    }
    
    if (indexPath.row == 1)
    {
        
        DescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell"];
        
        if (self.goal) {
            cell.descriptionTextView.text = self.goal.goalDescription;
        }
        cell.delegate = self;
        
        cell.descriptionTextView.textColor = [UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f];


        return cell;
    }

    if (indexPath.row == 2 + self.goal.subGoals.count)
    {
        AddSubGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addSubGoalCell"];
        
        cell.delegate = self;

        return cell;
    }
    
    if (indexPath.row == 3 + self.goal.subGoals.count)
    {
        DatePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goalDateCell"];
        
        cell.delegate = self;
        
        [cell.goalDatePicker setDate:[NSDate date]];
        cell.goalDatePicker.minimumDate = [NSDate date];
        
        NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
        
        [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
        
        if (!self.goal.goalDate) {
            cell.goalDatePicker.date = [NSDate date];
        }
        
        else
        {
            cell.goalDatePicker.date = self.goal.goalDate;
        }
        
        [cell.goalDatePicker setTintColor: [UIColor colorWithRed:0.000f green:1.000f blue:0.590f alpha:1.00f]]; //Light Gree
        
        NSString *getDate = [dateGoalFormat stringFromDate:cell.goalDatePicker.date];
        
        cell.dateViewLabel.text = getDate;

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
        
        cell.subGoalTextField.text = ((SubGoal *)[self.goal.subGoals objectAtIndex:indexPath.row - 2 ]).subGoalTitle;
        
        cell.delegate = self;
        
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
    self.goal.goalTitle = goaltitleCell.goalTitleTextField.text;
    
    NSLog(@"goaltitle: %@", self.goal.goalTitle);
}

//Implements the delegate method for the subGoalCell
-(void)subGoalTextFieldUpdated:(SubGoalTableViewCell *)subGoalCell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:subGoalCell];
    
    SubGoal *subGoalToUpdateText = self.goal.subGoals[indexPath.row - 2];
    
    subGoalToUpdateText.subGoalTitle = subGoalCell.subGoalTextField.text;
    
}

//Implements the delegate method for the descriptionCell
-(void)descriptionTextViewUpdated:(DescriptionTableViewCell *)descriptionCell
{
    self.goal.goalDescription = descriptionCell.descriptionTextView.text;
    
    NSLog(@"Description: %@", self.goal.goalDescription);
}

-(void)addSubGoalCellToTableView
{
    SubGoal *newSubgoal = [[GoalController sharedInstance] createSubGoal];
    newSubgoal.goal = self.goal;
    
    [self.tableView reloadData];
}

-(void)dateValueChanged:(NSDate *)date
{
    self.goal.goalDate = date;
    
    NSLog(@"This is the DATE: %@", self.goal.goalDate);
    
    [self.tableView reloadData];
}

-(void)saveChangesButtonTappedToSaveChanges
{
    [self.dismissViewDelegate dismissViewControllerUponSaveButtonTap];
}

#pragma mark - Editing The TableView

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfCells = 5 + self.goal.subGoals.count;
    
    if (indexPath.row > 1 && indexPath.row < numberOfCells - 3)
    {
        return YES;
    }
    
    else
    {
        return NO;
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *lblDate = [[UILabel alloc] init];
    [lblDate setFont:[UIFont systemFontOfSize:25.0]];
    [lblDate setTextColor:[UIColor colorWithRed:0.000f green:1.000f blue:0.590f alpha:1.00f]]; //Light Green]];
    [lblDate setBackgroundColor:[UIColor clearColor]];
    
    return lblDate;
}

//Delete SubGoal Cells
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"%ld", indexPath.row);
        SubGoal *subGoal = self.goal.subGoals[indexPath.row - 2];
        [[GoalController sharedInstance] removeSubGoalFromGoal:subGoal];
        [[GoalController sharedInstance] save];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

@end
