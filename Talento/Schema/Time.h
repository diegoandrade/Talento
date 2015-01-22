//
//  Time.h
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Time : NSManagedObject

@property (nonatomic, retain) NSDate * pause;
@property (nonatomic, retain) NSDate * start;
@property (nonatomic, retain) NSDate * stop;
@property (nonatomic, retain) Item *item;

@end
