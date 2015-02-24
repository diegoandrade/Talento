//
//  AddItemViewController.h
//  Talento
//
//  Created by Diego Andrade on 1/22/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@protocol AddItemViewControllerDelegate;

@interface AddItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *descriptionItemFIeld;
@property (weak, nonatomic) IBOutlet UITextField *myPointsItemField;
@property (weak, nonatomic) IBOutlet UITextField *maxPointItemField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerItem;
@property (weak, nonatomic) IBOutlet UISwitch *isCompleteItem;

@property (nonatomic,weak) id <AddItemViewControllerDelegate> delegate;
@property (nonatomic,strong) Item *currentItem;


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@protocol AddItemViewControllerDelegate <NSObject>
-(void) addItemViewControllerDidSave;
-(void) addItemViewControllerDidCancel:(Item *)itemToDelete;
@end



