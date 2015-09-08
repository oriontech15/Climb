//
//  GoalsListViewDataSource.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "Goal.h"

@interface GoalsListViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Goal *goal;

@end
