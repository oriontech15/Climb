//
//  AddGoalViewController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "AddGoalViewController.h"
#import "AddHeaderGoalTableViewCell.h"
#import "DatePickerTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "SubGoalTableViewCell.h"
#import "GoalTitleViewDataSource.h"
#import "GoalController.h"

@interface AddGoalViewController ()

@property (nonatomic, strong) DatePickerTableViewCell *goalPickerCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GoalTitleViewDataSource *dataSource;

@end

@implementation AddGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.goal = [[GoalController sharedInstance] createGoal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getSelectedDate:(UIDatePicker *)picker
{
    self.goalPickerCell.dateViewLabel = [UILabel new];
    NSDateFormatter *dateGoalFormat = [[NSDateFormatter alloc] init];
    
    [dateGoalFormat setDateFormat:@"MMMM dd, yyyy"];
    
    NSString *getDate = [dateGoalFormat stringFromDate:picker.date];
    
    NSLog(@"date: %@", getDate);
    
    self.goalPickerCell.dateViewLabel.text = getDate;
    
    [GoalController sharedInstance].goalDate = picker.date;
    
    self.goal.goalDate = [GoalController sharedInstance].goalDate;
    
    NSLog(@"GoalDate: %@", self.goal.goalDate);
    
    [self.tableView reloadData];
}

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender
{
    [[GoalController sharedInstance] save];
    [self dismissViewControllerAnimated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
