//
//  ProgressController.h
//  framedUP
//
//  Created by Justin Smith on 9/20/15.
//  Copyright © 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressController : NSObject

@property (nonatomic, strong) NSNumber *progress;

-(void)addProgress;
-(void)removeProgress;

@end
