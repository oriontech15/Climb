//
//  SubGoal.h
//  framedUP
//
//  Created by Justin Smith on 8/24/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Goal;

@interface SubGoal : NSManagedObject

@property (nonatomic, retain) NSString *subGoalTitle;
@property (nonatomic, retain) Goal *goal;

@end
