//
//  AddWeekViewController.m
//  Talento
//
//  Created by Diego Andrade on 1/21/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import "AddWeekViewController.h"

@interface AddWeekViewController ()

@end

@implementation AddWeekViewController
@synthesize descriptionWeek;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // descriptionWeekField.text = [NSString stringWithFormat:@"%@",[self.currentWeek descriptionWeek]];
    
    
    
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

- (IBAction)cancel:(id)sender {
    [self.delegate addWeekViewControllerDidCancel:[self currentWeek]];
}

- (IBAction)save:(id)sender {
    [self.currentWeek setNameWeek:descriptionWeek.text];
    [self.delegate addWeekViewControllerDidSave];

}
@end
