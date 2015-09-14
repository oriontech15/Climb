//
//  GoalDatePicker.m
//  framedUP
//
//  Created by Justin Smith on 9/13/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GoalDatePicker.h"

@interface GoalDatePicker () <UIPickerViewDelegate>

@end

@implementation GoalDatePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        
        self.tintColor = [UIColor greenColor];        
    }
    return self;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *lblDate = [[UILabel alloc] init];
    [lblDate setFont:[UIFont systemFontOfSize:25.0]];
    [lblDate setTextColor:[UIColor blueColor]];
    [lblDate setBackgroundColor:[UIColor clearColor]];
    
    return lblDate;
}

@end
