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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    
    UITabBarItem *mainButton = [tabBar.items objectAtIndex:0];
    UITabBarItem *listButton = [tabBar.items objectAtIndex:1];
    
    [mainButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [listButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.996f green:0.906f blue:0.333f alpha:1.00f], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [mainButton setImage:[[UIImage imageNamed:@"tabBarButtonMain.pdf"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    [mainButton setSelectedImage:[[UIImage imageNamed:@"tabBarButtonMain.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [listButton setImage:[[UIImage imageNamed:@"tabBarButtonList.pdf"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    [listButton setSelectedImage:[[UIImage imageNamed:@"tabBarButtonList.pdf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

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
