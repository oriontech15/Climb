//
//  GoalController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalController.h"
#import "Stack.h"

@interface GoalController ()

@property (nonatomic, strong) NSArray *goals;

@end

@implementation GoalController

+(GoalController *)sharedInstance
{
    static GoalController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GoalController new];
    });
    
    return sharedInstance;
}

-(Goal *)createGoal
{
    Goal *goal = [NSEntityDescription insertNewObjectForEntityForName:@"Goal" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    return goal;
}

-(SubGoal *)createSubGoal
{
    SubGoal *subGoal = [NSEntityDescription insertNewObjectForEntityForName:@"SubGoal" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    
    return subGoal;
}

-(NSArray *)goals
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Goal"];
    
    NSError *error;
    
    NSArray *allGoals = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"Error %@", error.localizedDescription);
    }
    
    return allGoals;
}

-(NSArray *)subGoals
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SubGoal"];
    
    NSError *error;
    
    NSArray *allSubGoals = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"Error %@", error.localizedDescription);
    }
    
    return allSubGoals;
}

//Remove an entry if called and not empty
-(void)removeGoal:(Goal *)goal
{
    [goal.managedObjectContext deleteObject:goal];
}

-(void)removeSubGoalFromGoal:(SubGoal *)subGoal
{
    [subGoal.managedObjectContext deleteObject:subGoal];
}

//Save the existing entries by calling the saveToPersistentStorage method
-(void)save
{
    [[Stack sharedInstance].managedObjectContext save:nil];
}

@end
