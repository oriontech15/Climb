//
//  GoalCollectionViewCell.m
//  framedUP
//
//  Created by Justin Smith on 9/2/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalCollectionViewCell.h"

@interface GoalCollectionViewCell ()

@end

@implementation GoalCollectionViewCell

- (IBAction)goalDetailButtonTapped:(id)sender
{
    [self.delegate goToGoalDetailsViewOf:self];
}

@end

