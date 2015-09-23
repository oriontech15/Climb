//
//  SubGoal+CoreDataProperties.h
//  framedUP
//
//  Created by Justin Smith on 9/22/15.
//  Copyright © 2015 Justin Smith. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SubGoal.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubGoal (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *subGoalDate;
@property (nullable, nonatomic, retain) NSNumber *subGoalFinished;
@property (nullable, nonatomic, retain) NSString *subGoalTitle;
@property (nullable, nonatomic, retain) Goal *goal;

@end

NS_ASSUME_NONNULL_END
