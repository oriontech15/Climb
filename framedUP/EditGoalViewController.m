//
//  AddGoalViewController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "EditGoalViewController.h"
#import "AddHeaderGoalTableViewCell.h"
#import "DatePickerTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "SubGoalTableViewCell.h"
#import "EditGoalViewDataSource.h"
#import "GoalController.h"

@interface EditGoalViewController () <DisMissViewControllerDelegate>

@property (nonatomic, strong) DatePickerTableViewCell *goalPickerCell;
@property (nonatomic, strong) SubGoalTableViewCell *subGoalCell;
@property (nonatomic, strong) AddHeaderGoalTableViewCell *goalTitleCell;
@property (nonatomic, strong) DescriptionTableViewCell *descriptionCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet EditGoalViewDataSource *dataSource;

@end

@implementation EditGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.backgroundColor = [UIColor darkGrayColor];
    
    if (!self.goal) {
        self.goal = [[GoalController sharedInstance] createGoal];
    }
    
    self.dataSource.goal = self.goal;
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    ((EditGoalViewDataSource *) self.tableView.dataSource).dismissViewDelegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];    
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
    
//    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if (!self.goal.goalTitle)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Goal Title" message:@"You are saving without a title for your Goal. Please add a title or tap \"Cancel\" to stop creating a goal." preferredStyle:UIAlertControllerStyleAlert];
        
        [[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setBackgroundColor:[UIColor grayColor]];
        
        alert.view.layer.cornerRadius = 22;
        alert.view.layer.masksToBounds = YES;
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [self.goal.managedObjectContext undo];
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:action];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else
    {
        [self.view endEditing:YES];
        [[GoalController sharedInstance] save];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
