//
//  AddHeaderGoalTableViewCell.m
//  framedUP
//
//  Created by Justin Smith on 8/13/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "AddHeaderGoalTableViewCell.h"

@implementation AddHeaderGoalTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.goalTitleTextField.delegate = self;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate goalTitleTextFieldUpdated:self];
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
