//
//  ScrollViewController.m
//  Hw-Toast-StopWatch-ScrollView
//
//  Created by Yin Kokpheng on 11/19/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Listen for keyboard appearances and disappearances
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    [self.scrollView setScrollEnabled:true];
    [self.scrollView setContentSize:CGSizeMake(383, 900)];
    
}

- (void)keyboardDidShow: (NSNotification *) notif{
    [self.scrollView setScrollEnabled:true];
    [self.scrollView setContentOffset:CGPointMake(0, 200) animated:YES] ;
    [self.scrollView setContentSize:CGSizeMake(383, 900)];
}

- (void)keyboardDidHide: (NSNotification *) notif{
    [self.scrollView setScrollEnabled:false];
    [self.scrollView setContentSize:CGSizeMake(383, 598)];
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

@end
