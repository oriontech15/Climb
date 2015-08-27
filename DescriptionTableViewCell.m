//
//  DescriptionTableViewCell.m
//  framedUP
//
//  Created by Justin Smith on 8/17/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "DescriptionTableViewCell.h"

@implementation DescriptionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.delegate descriptionTextViewUpdated:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
