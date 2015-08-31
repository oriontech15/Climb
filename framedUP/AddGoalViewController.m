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

@interface AddGoalViewController () <DisMissViewControllerDelegate>

@property (nonatomic, strong) DatePickerTableViewCell *goalPickerCell;
@property (nonatomic, strong) SubGoalTableViewCell *subGoalCell;
@property (nonatomic, strong) AddHeaderGoalTableViewCell *goalTitleCell;
@property (nonatomic, strong) DescriptionTableViewCell *descriptionCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GoalTitleViewDataSource *dataSource;

@end

@implementation AddGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    ((GoalTitleViewDataSource *) self.tableView.dataSource).dismissViewDelegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[GoalController sharedInstance] save];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender
{
    [self.goal.managedObjectContext undo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissViewControllerUponSaveButtonTap
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
