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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender
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
