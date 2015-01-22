//
//  Week.h
//  Talento
//
//  Created by Diego Andrade on 1/22/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Week : NSManagedObject

@property (nonatomic, retain) NSString * descriptionWeek;
@property (nonatomic, retain) NSNumber * displayOrder;
@property (nonatomic, retain) NSString * nameWeek;
@property (nonatomic, retain) NSNumber * sRate;
@property (nonatomic, retain) NSSet *items;
@end

@interface Week (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
