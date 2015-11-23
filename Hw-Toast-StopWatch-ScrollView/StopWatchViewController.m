//
//  StopWatchViewController.m
//  Hw-Toast-StopWatch-ScrollView
//
//  Created by Kokpheng on 11/22/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "StopWatchViewController.h"

@interface StopWatchViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation StopWatchViewController
int counter;
NSTimeInterval startTime;
NSTimer *timer;
NSMutableArray *timeArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundTableView.delegate = self;
    self.roundTableView.dataSource =self;
     counter = 1;
     startTime = [[NSDate date] timeIntervalSinceNow];
    timer = [[NSTimer alloc]init];
    timeArray = [[NSMutableArray alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startButtonAction:(id)sender {
    [self makeStartAppear:false];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime) userInfo:nil repeats:true];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    startTime = [NSDate timeIntervalSinceReferenceDate];
    
    [timeArray removeAllObjects];
    [self.roundTableView reloadData];
    counter = 1;
}

-(void)updateTime{
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - startTime;
    
    UInt8 minute = (UInt8)(elapsedTime / 60.0);
    elapsedTime -= ((NSTimeInterval)minute) * 60;
    

    UInt8 second = (UInt8)elapsedTime;
    elapsedTime -= (NSTimeInterval)second;
    
    UInt8 fraction = (UInt8)(elapsedTime * 100.0);
   
    NSString *stringMinutes = minute > 9 ? [NSString stringWithFormat:@"%d", minute]: [NSString stringWithFormat:@"0%d", minute];
    NSString *stringSeconds = second > 9 ? [NSString stringWithFormat:@"%d", second]: [NSString stringWithFormat:@"0%d", second];
    NSString *stringFraction = fraction > 9 ? [NSString stringWithFormat:@"%d", fraction]: [NSString stringWithFormat:@"0%d", fraction];
    
    self.stopWatchTimeLabel.text = [NSString stringWithFormat:@"%@:%@:%@", stringMinutes, stringSeconds, stringFraction];
}

- (IBAction)stopButtonAction:(id)sender {
     [self makeStartAppear:true];
    [timer invalidate];
}

- (IBAction)roundButtonAction:(id)sender {
     //[self makeStartAppear:true];
    [timeArray addObject:[NSString stringWithFormat:@"%d  -> %@", counter, self.stopWatchTimeLabel.text]];
    counter++;
    
    [self.roundTableView reloadData];
}

-(void) makeStartAppear:(BOOL)appear{
    if (appear) {
        self.startButton.hidden = false;
        self.stopButton.hidden = true;
        self.roundButton.hidden = true;
    }else{
        self.startButton.hidden = true;
        self.stopButton.hidden = false;
        self.roundButton.hidden = false;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return timeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.roundTableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text =[NSString stringWithFormat:@"%@", [timeArray objectAtIndex:indexPath.row]];
    return cell;
    
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
