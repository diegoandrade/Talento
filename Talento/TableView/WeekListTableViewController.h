//
//  WeekListTableViewController.h
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Week.h"
#import "AddWeekViewController.h"
#import "AppDelegate.h"

@interface WeekListTableViewController : UITableViewController <AddWeekViewControllerDelegate,NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSFetchedResultsController *fetchedResultsController;

@end