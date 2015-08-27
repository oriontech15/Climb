//
//  DescriptionTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/17/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DescriptionTableViewCellDelegate;

@interface DescriptionTableViewCell : UITableViewCell <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) id<DescriptionTableViewCellDelegate> delegate;

@end

@protocol DescriptionTableViewCellDelegate <NSObject>

-(void)descriptionTextViewUpdated:(DescriptionTableViewCell *)descriptionCell;

@end