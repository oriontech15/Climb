//
//  AddGoalViewDataSource.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

#import "AddHeaderGoalTableViewCell.h"
#import "DatePickerTableViewCell.h"
#import "SubGoalTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "SaveChangesTableViewCell.h"
#import "Goal.h"
#import "AddSubGoalTableViewCell.h"
#import "SubGoal.h"

static NSInteger numberOfRows = 0;

@interface GoalTitleViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) SubGoal *subGoal;

@end
