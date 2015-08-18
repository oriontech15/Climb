//
//  GoalController.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goal.h"

@interface GoalController : NSObject

@property (nonatomic) NSMutableArray *cells;

+(GoalController *)sharedInstance;

- (void)removeGoal:(Goal *)goal;
- (Goal *)createGoal;
- (void)save;

@end
