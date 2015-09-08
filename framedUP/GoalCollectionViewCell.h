//
//  GoalCollectionViewCell.h
//  framedUP
//
//  Created by Justin Smith on 9/2/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"

@protocol GoalCollectionViewCellDelegate;

@interface GoalCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *collectionViewGoalLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionViewMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionViewDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionViewYearLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectionViewToDetailViewButton;
@property (nonatomic, strong) Goal *goal;
@property (nonatomic, weak) id<GoalCollectionViewCellDelegate> delegate;

@end

@protocol GoalCollectionViewCellDelegate <NSObject>

-(void)goToGoalDetailsViewOf:(GoalCollectionViewCell *)cell;

@end