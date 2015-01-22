//
//  Item.h
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CategoryA, Image, Time, Week;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * descriptionItem;
@property (nonatomic, retain) NSNumber * isComplete;
@property (nonatomic, retain) NSNumber * itRepeats;
@property (nonatomic, retain) NSNumber * maxPoints;
@property (nonatomic, retain) NSNumber * maxScore;
@property (nonatomic, retain) NSNumber * overAchievement;
@property (nonatomic, retain) CategoryA *category;
@property (nonatomic, retain) Image *image;
@property (nonatomic, retain) NSSet *times;
@property (nonatomic, retain) Week *week;
@end

@interface Item (CoreDataGeneratedAccessors)

- (void)addTimesObject:(Time *)value;
- (void)removeTimesObject:(Time *)value;
- (void)addTimes:(NSSet *)values;
- (void)removeTimes:(NSSet *)values;

@end
