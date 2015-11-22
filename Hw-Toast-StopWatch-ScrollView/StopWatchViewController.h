//
//  StopWatchViewController.h
//  Hw-Toast-StopWatch-ScrollView
//
//  Created by Kokpheng on 11/22/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopWatchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *roundButton;
@property (weak, nonatomic) IBOutlet UILabel *stopWatchTimeLabel;
@property (weak, nonatomic) IBOutlet UITableView *roundTableView;

@end
