//
//  DatePickerTableViewCell.h
//  framedUP
//
//  Created by Justin Smith on 8/17/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIDatePicker *goalDatePicker;
@property (strong, nonatomic) IBOutlet UILabel *dateViewLabel;

@end