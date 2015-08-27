//
//  GoalController.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goal.h"
#import "DatePickerTableViewCell.h"

static NSString *DateUpdated = @"DateUpdated";

@interface GoalController : NSObject

@property (nonatomic) NSMutableArray *cells;
@property (nonatomic, strong, readonly) NSArray *goals;
@property (nonatomic, strong) NSDate *goalDate;

+(GoalController *)sharedInstance;

- (void)removeGoal:(Goal *)goal;
- (Goal *)createGoal;
- (SubGoal *)createSubGoal;
- (void)save;

@end
