//
//  GoalController.m
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalController.h"

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

@end
