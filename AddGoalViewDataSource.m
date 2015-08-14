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

@end

@implementation AddGoalViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0)
    {
        AddHeaderGoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
        return cell;
    }
    
    else
    {
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell"];
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }
    else
    {
        return 125;
    }
}

@end
