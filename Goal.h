//
//  Goal.h
//  framedUP
//
//  Created by Justin Smith on 8/24/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SubGoal;

@interface Goal : NSManagedObject

@property (nonatomic, retain) NSDate * goalDate;
@property (nonatomic, retain) NSString * goalDescription;
@property (nonatomic, retain) NSString * goalTitle;
@property (nonatomic, retain) NSOrderedSet *subGoals;
@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)insertObject:(SubGoal *)value inSubGoalsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSubGoalsAtIndex:(NSUInteger)idx;
- (void)insertSubGoals:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSubGoalsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSubGoalsAtIndex:(NSUInteger)idx withObject:(SubGoal *)value;
- (void)replaceSubGoalsAtIndexes:(NSIndexSet *)indexes withSubGoals:(NSArray *)values;
- (void)addSubGoalsObject:(SubGoal *)value;
- (void)removeSubGoalsObject:(SubGoal *)value;
- (void)addSubGoals:(NSOrderedSet *)values;
- (void)removeSubGoals:(NSOrderedSet *)values;

@end
