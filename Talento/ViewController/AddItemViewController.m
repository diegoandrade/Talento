//
//  AddItemViewController.m
//  Talento
//
//  Created by Diego Andrade on 1/22/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
{
    NSArray * _pickerData;
    NSArray * _pickerRelativeValue;
    NSNumber * relativeVal;
    BOOL isCompleteVal;
    NSNumber *myIsCompleteVal;
}

@end

@implementation AddItemViewController
@synthesize descriptionItemFIeld;
@synthesize myPointsItemField;
@synthesize maxPointItemField;
@synthesize pickerItem;
@synthesize isCompleteItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initialization Data
    _pickerData = @[@"Family", @"Self", @"Work", @"Business", @"Entertainmet"];
    _pickerRelativeValue =@[@25, @10, @35, @15, @35];
    //categoryField = _pickerData[0];
    relativeVal = [NSNumber numberWithFloat:([_pickerRelativeValue[0] floatValue])/100.0];
    
    
    //Connect Data
    self.pickerItem.dataSource = self;
    self.pickerItem.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
}

- (IBAction)cancel:(id)sender {
}
@end
