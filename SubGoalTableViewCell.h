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

@interface SubGoalTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *subGoalTextField;
@property (strong, nonatomic) id<SubGoalTableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@end

@protocol SubGoalTableViewCellDelegate <NSObject>

- (void)subGoalTextFieldUpdated:(SubGoalTableViewCell *)subGoalCell;

@end