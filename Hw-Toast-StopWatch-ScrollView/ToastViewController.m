//
//  ToastViewController.m
//  Hw-Toast-StopWatch-ScrollView
//
//  Created by Yin Kokpheng on 11/19/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "ToastViewController.h"

@interface ToastViewController ()

@end

@implementation ToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelMessage.layer.masksToBounds = YES;
    self.labelMessage.layer.cornerRadius = 30.0;
    self.labelMessage.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fireToastMassage:(id)sender {
    
    self.labelMessage.hidden = false;
    [UIView animateWithDuration:1 animations:^(void){
        self.labelMessage.alpha = 0;
        self.labelMessage.alpha = 1;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.0 animations:^(void){
            self.labelMessage.alpha = 1;
            self.labelMessage.alpha = 0;
            
        }];
    }];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
