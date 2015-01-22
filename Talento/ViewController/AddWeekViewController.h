//
//  AddWeekViewController.h
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Week.h"

@protocol AddWeekViewControllerDelegate;

@interface AddWeekViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *descriptionWeek;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@property (nonatomic,strong) Week *currentWeek;
@property (nonatomic,weak) id <AddWeekViewControllerDelegate> delegate;

@end


@protocol AddWeekViewControllerDelegate <NSObject>
-(void) addWeekViewControllerDidSave;
-(void) addWeekViewControllerDidCancel:(Week *)weekToDelete;
@end
