//
//  ViewController.h
//  framedUP
//
//  Created by Justin Smith on 7/27/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"

@interface GoalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) Goal *goal;

@end

