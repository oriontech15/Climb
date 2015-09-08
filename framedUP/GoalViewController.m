//
//  ViewController.m
//  framedUP
//
//  Created by Justin Smith on 7/27/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalViewController.h"
#import "GoalViewDataSource.h"
#import "GoalsDetailViewController.h"
#import "GoalCollectionViewCell.h"
#import "GoalController.h"

@interface GoalViewController () <GoalCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation GoalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ((GoalViewDataSource *)self.collectionView.dataSource).goalVC = self;
    
    [self.navigationController.tabBarItem setImage:[[UIImage imageNamed:@"Mountain.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"Mountain.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

-(void)goToGoalDetailsViewOf:(GoalCollectionViewCell *)cell
{
    [self performSegueWithIdentifier:@"toDetailView" sender:cell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GoalCollectionViewCell *cell = sender;
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    Goal *goal = [GoalController sharedInstance].goals[indexPath.row];
    
    UINavigationController *navController = segue.destinationViewController;
    GoalsDetailViewController *detailVC = ((GoalsDetailViewController *)navController.topViewController);
    
    detailVC.goal = goal;
}

@end
