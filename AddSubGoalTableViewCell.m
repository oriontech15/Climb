//
//  AddSubGoalTableViewCell.m
//  framedUP
//
//  Created by Justin Smith on 8/25/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "AddSubGoalTableViewCell.h"

@implementation AddSubGoalTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)addSubGoalButtonTapped:(UIButton *)sender
{
    [self.delegate addSubGoalCellToTableView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
