//
//  GoalsDetailViewController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalsDetailViewController.h"
#import "DetailViewControllerDataSource.h"
#import "EditGoalViewController.h"

@interface GoalsDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet DetailViewControllerDataSource *dataSource;

@end

@implementation GoalsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataSource.goal = self.goal;

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"editButton"])
    {
        UINavigationController *navController = segue.destinationViewController;
        EditGoalViewController *editVC = ((EditGoalViewController *)navController.topViewController);
        
        editVC.goal = self.goal;
    }
}


@end
