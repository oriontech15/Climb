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
#import "SubGoalTableViewCell.h"
#import "GoalTitleViewDataSource.h"
#import "GoalController.h"

@interface AddGoalViewController ()

@property (nonatomic) AddHeaderGoalTableViewCell *goalTitleCell;
@property (nonatomic) DatePickerTableViewCell *goalPickerCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GoalTitleViewDataSource *dataSource;

@end

@implementation AddGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.goalPickerCell = [DatePickerTableViewCell new];
    self.dataSource = [GoalTitleViewDataSource new];
    [GoalController sharedInstance].cells = [NSMutableArray new];
    NSLog(@"array count: %ld", [GoalController sharedInstance].cells.count);
}

- (IBAction)headerGoalButtonTapped:(id)sender
{
    NSLog(@"TextField Text: %@", self.goalTitleCell.goalTitleTextField.text);
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
    
    NSLog(@"test: %@", self.goalPickerCell.dateViewLabel.text);
    
    [self.tableView reloadData];
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
