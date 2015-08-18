//
//  Stack.h
//  DayX
//
//  Created by Justin Smith on 8/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface Stack : NSObject

+ (Stack *)sharedInstance;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end
