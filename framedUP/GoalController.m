//
//  GoalController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalController.h"
#import "Stack.h"

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

-(NSArray *)entries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Goal"];
    
    NSError *error;
    
    NSArray *allEntries = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"Error %@", error.localizedDescription);
    }
    
    return allEntries;
}

//Remove an entry if called and not empty
-(void)removeGoal:(Goal *)goal
{
    [goal.managedObjectContext deleteObject:goal];
}

//Save the existing entries by calling the saveToPersistentStorage method
-(void)save
{
    [[Stack sharedInstance].managedObjectContext save:nil];
}

@end
