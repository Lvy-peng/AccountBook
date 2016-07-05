//
//  RecordWelcomeViewController.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordWelcomeViewController.h"
#import "RecordViewController.h"

static const int FLOAT_NUMBER_HEIGHT = 100;

@interface RecordWelcomeViewController () {
    UIButton *_welcomeButton;
}

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RecordWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initwelcomeView];
   // [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initwelcomeView {
    //self.view.backgroundColor = [UIColor redColor];
    self.title = @"Welcome";
    
    _welcomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _welcomeButton.frame = CGRectMake(0, CGRectGetMidY(self.view.frame) + FLOAT_NUMBER_HEIGHT, CGRectGetWidth(self.view.frame), 40);
    _welcomeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_welcomeButton setTitle:@"Welcome to AccoutBook" forState:UIControlStateNormal];
    [_welcomeButton setBackgroundColor:[UIColor greenColor]];
    [_welcomeButton addTarget:self action:@selector(welcomeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_welcomeButton];
}

#pragma mark - Class Method
- (void)welcomeButtonPressed {
    RecordViewController *recordVC = [[RecordViewController alloc] init];
    [self.navigationController pushViewController:recordVC animated:YES];
}

- (void) startTimer{
    int timeInterval = 2.0f;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                  target:self
                                                selector:@selector(pushNextView:)  userInfo:nil
                                                 repeats:YES];
}

// 停止定时器
- (void) stopTimer{
    if (self.timer != nil){
        // 定时器调用invalidate后，就会自动执行release方法。不需要在显示的调用release方法
        [self.timer invalidate];
    }
}

- (void)pushNextView:(NSTimer *)timer {
   // [self stopTimer];
    
    RecordViewController *recordVC = [[RecordViewController alloc] init];
    [self.navigationController pushViewController:recordVC animated:YES];
    
    
    
}


@end
