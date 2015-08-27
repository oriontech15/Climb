//
//  AddSubGoalTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/25/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubGoalTableViewCell.h"

@protocol addSubGoalTableViewCellDelegate;

@interface AddSubGoalTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *addSubGoalButton;
@property (weak, nonatomic) id<addSubGoalTableViewCellDelegate> delegate;

@end

@protocol addSubGoalTableViewCellDelegate <NSObject>

- (void) addSubGoalCellToTableView;

@end
