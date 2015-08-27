//
//  DetailViewDescriptionTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/26/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewDescriptionCellDelegate;

@interface DetailViewDescriptionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, weak) id<DetailViewDescriptionCellDelegate> delegate;

@end

@protocol DetailViewDescriptionCellDelegate <NSObject>

-(void)detailViewDescriptionTextViewUpdated:(DetailViewDescriptionTableViewCell *)descriptionCell;

@end
