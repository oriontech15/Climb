//
//  GoalViewDataSource.h
//  framedUP
//
//  Created by Justin Smith on 9/2/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "Goal.h"
#import "GoalViewController.h"
#import "GoalCollectionViewCell.h"

@protocol goToGoalDetailViewDelegate;

@interface GoalViewDataSource : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) id<goToGoalDetailViewDelegate> toDetailViewDelegate;
@property (nonatomic, weak) GoalViewController *goalVC;

@end


@protocol goToGoalDetailViewDelegate <NSObject>

- (void) goToGoalDetailViewUponButtonTap;

@end