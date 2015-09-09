//
//  GoalViewDataSource.m
//  framedUP
//
//  Created by Justin Smith on 9/2/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalViewDataSource.h"
#import "GoalController.h"
#import "GoalCollectionViewCell.h"

//static NSString *noGoalCellID = @"noGoalCellID";

@interface GoalViewDataSource ()

@end

@implementation GoalViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.goal = [GoalController sharedInstance].goals[indexPath.row];
    
    GoalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCollectionCellID" forIndexPath:indexPath];
    
    cell.delegate = self.goalVC;
    
    NSDateFormatter *monthFormat = [[NSDateFormatter alloc] init];
    [monthFormat setDateFormat:@"MMMM"];
    NSString *getMonth = [monthFormat stringFromDate:self.goal.goalDate];
    
    NSDateFormatter *dayFormat = [[NSDateFormatter alloc] init];
    [dayFormat setDateFormat:@"dd"];
    NSString *getDay = [dayFormat stringFromDate:self.goal.goalDate];
    
    NSDateFormatter *yearFormat = [[NSDateFormatter alloc] init];
    [yearFormat setDateFormat:@"yyyy"];
    NSString *getYear = [yearFormat stringFromDate:self.goal.goalDate];
    
    cell.collectionViewMonthLabel.text = getMonth;
    cell.collectionViewDayLabel.text = getDay;
    cell.collectionViewYearLabel.text = getYear;
    cell.collectionViewGoalLabel.text = self.goal.goalTitle;
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return [GoalController sharedInstance].goals.count;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.superview.bounds.size;
}

@end
