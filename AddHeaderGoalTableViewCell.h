//
//  AddHeaderGoalTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/13/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GoalTitleTableViewCellTextFieldDelegate;
@protocol DatePickerViewUpdatedToViewDelegate;

@interface AddHeaderGoalTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) id<GoalTitleTableViewCellTextFieldDelegate> delegate;
@property (weak, nonatomic) id<DatePickerViewUpdatedToViewDelegate> dateDelegate;
@property (strong, nonatomic) IBOutlet UITextField *goalTitleTextField;

@end

@protocol GoalTitleTableViewCellTextFieldDelegate <NSObject>

- (void)goalTitleTextFieldUpdated:(AddHeaderGoalTableViewCell *)goaltitleCell;

@end

@protocol DatePickerViewUpdatedToViewDelegate <NSObject>

- (void)datePickerDidEndEditing:(NSDate *)date;

@end