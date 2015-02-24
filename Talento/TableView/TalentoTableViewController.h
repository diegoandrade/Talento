//
//  TalentoTableViewController.h
//  Talento
//
//  Created by Diego Andrade on 1/2/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "AddItemViewController.h"
#import "Item.h"
//#import "DisplayEditViewController.h"
#import "AppDelegate.h"

@interface TalentoTableViewController : UITableViewController <AddItemViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) Item *currentItem;

@end
