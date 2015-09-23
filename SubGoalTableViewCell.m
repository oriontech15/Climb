//
//  SubGoalTableViewCell.m
//  framedUP
//
//  Created by Justin Smith on 8/17/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "SubGoalTableViewCell.h"

@implementation SubGoalTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate subGoalTextFieldUpdated:self];
}

- (IBAction)subGoalDateButtonTapped:(id)sender
{
    [self.dateButtonDelegate subGoalDateButtonTapped];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
