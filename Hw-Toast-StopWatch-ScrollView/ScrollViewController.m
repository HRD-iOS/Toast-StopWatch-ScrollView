//
//  ScrollViewController.m
//  Hw-Toast-StopWatch-ScrollView
//
//  Created by Yin Kokpheng on 11/19/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   _scrollView.delegate = self;
    
    // Listen for keyboard appearances and disappearances
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

- (void)keyboardDidShow: (NSNotification *) notif{
   [self.scrollView setScrollEnabled:true];
  [self.scrollView setContentOffset:CGPointMake(0, 250) animated:YES] ;
  [self.scrollView setContentSize:CGSizeMake(383, 900)];
}

- (void)keyboardDidHide: (NSNotification *) notif{
   [self.scrollView setScrollEnabled:false];
   [self.scrollView setContentSize:CGSizeMake(383, 647)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
