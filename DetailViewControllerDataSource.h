//
//  DetailViewControllerDataSource.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "DetailViewTitleTableViewCell.h"
#import "DetailViewSubGoalTableViewCell.h"
#import "DetailViewDescriptionTableViewCell.h"
#import "DetailViewDateTableViewCell.h"
#import "Goal.h"
#import "SubGoal.h"

@interface DetailViewControllerDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) SubGoal *subGoal;

@end
