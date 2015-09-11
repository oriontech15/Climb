//
//  GoalsListViewController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalsListViewController.h"
#import "GoalsDetailViewController.h"
#import "GoalController.h"

@interface GoalsListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end

@implementation GoalsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tabBarItem.image = [[UIImage imageNamed:@"tabBarButtonList.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarButtonList.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.listTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toGoalsDetailView"])
    {
        UINavigationController *navController = segue.destinationViewController;
        
        GoalsDetailViewController *destinationViewController = navController.viewControllers[0];
        
        NSIndexPath *indexPath = [self.listTableView indexPathForSelectedRow];
        
        destinationViewController.goal = [GoalController sharedInstance].goals[indexPath.row];
    }
    
    
}


@end
