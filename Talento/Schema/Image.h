//
//  Image.h
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Image : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) Item *item;

@end
