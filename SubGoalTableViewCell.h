//
//  SubGoalTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/17/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol SubGoalTableViewCellDelegate;
@protocol SubGoalDateButtonDelegate;

@interface SubGoalTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *subGoalTextField;
@property (strong, nonatomic) id<SubGoalTableViewCellDelegate> delegate;
@property (strong, nonatomic) id<SubGoalDateButtonDelegate> dateButtonDelegate;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@end

@protocol SubGoalTableViewCellDelegate <NSObject>

- (void)subGoalTextFieldUpdated:(SubGoalTableViewCell *)subGoalCell;

@end

@protocol SubGoalDateButtonDelegate <NSObject>

- (void)subGoalDateButtonTapped;

@end