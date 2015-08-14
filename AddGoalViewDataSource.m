//
//  AddGoalViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "AddGoalViewDataSource.h"
#import "AddHeaderGoalTableViewCell.h"

@interface AddGoalViewDataSource ()

@property (nonatomic) AddHeaderGoalTableViewCell *goalTitleCell;

@end

@implementation AddGoalViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (IBAction)headerGoalButtonTapped:(id)sender
{
    NSLog(@"TextField Text: %@", self.goalTitleCell.goalTitleTextField.text);
}

@end
