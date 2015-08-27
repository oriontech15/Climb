//
//  DoneTableViewCell.m
//  framedUP
//
//  Created by Justin Smith on 8/18/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "SaveChangesTableViewCell.h"

@implementation SaveChangesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)saveChangesButtonTapped:(UIButton *)sender
{
    [self.delegate saveChangesButtonTappedToSaveChanges];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
