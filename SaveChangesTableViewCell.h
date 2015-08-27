//
//  DoneTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/18/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol saveChangesButtonTableViewCellDelegate;

@interface SaveChangesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *saveChangesButton;
@property (nonatomic, strong) id<saveChangesButtonTableViewCellDelegate> delegate;

@end

@protocol saveChangesButtonTableViewCellDelegate <NSObject>

- (void)saveChangesButtonTappedToSaveChanges;

@end