//
//  AddGoalViewController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "AddGoalViewController.h"
#import "AddHeaderGoalTableViewCell.h"

@interface AddGoalViewController ()

@property (nonatomic) AddHeaderGoalTableViewCell *goalTitleCell;

@end

@implementation AddGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)headerGoalButtonTapped:(id)sender
{
    NSLog(@"TextField Text: %@", self.goalTitleCell.goalTitleTextField.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
