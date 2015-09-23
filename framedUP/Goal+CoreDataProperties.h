//
//  Goal+CoreDataProperties.h
//  framedUP
//
//  Created by Justin Smith on 9/22/15.
//  Copyright © 2015 Justin Smith. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Goal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Goal (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *goalDate;
@property (nullable, nonatomic, retain) NSString *goalDescription;
@property (nullable, nonatomic, retain) NSString *goalTitle;
@property (nullable, nonatomic, retain) NSOrderedSet<SubGoal *> *subGoals;

@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)insertObject:(SubGoal *)value inSubGoalsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSubGoalsAtIndex:(NSUInteger)idx;
- (void)insertSubGoals:(NSArray<SubGoal *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSubGoalsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSubGoalsAtIndex:(NSUInteger)idx withObject:(SubGoal *)value;
- (void)replaceSubGoalsAtIndexes:(NSIndexSet *)indexes withSubGoals:(NSArray<SubGoal *> *)values;
- (void)addSubGoalsObject:(SubGoal *)value;
- (void)removeSubGoalsObject:(SubGoal *)value;
- (void)addSubGoals:(NSOrderedSet<SubGoal *> *)values;
- (void)removeSubGoals:(NSOrderedSet<SubGoal *> *)values;

@end

NS_ASSUME_NONNULL_END
