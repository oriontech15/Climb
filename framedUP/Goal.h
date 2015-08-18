//
//  Goal.h
//  framedUP
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Goal : NSManagedObject

@property (nonatomic) NSString *subGoal;
@property (nonatomic) NSString *goalDescription;
@property (nonatomic) NSString *goalTitle;
@property (nonatomic) NSDate *goalDate;

@end
