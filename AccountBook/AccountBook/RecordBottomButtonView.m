//
//  RecordBottomButtonView.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordBottomButtonView.h"

static const int   FLOAT_NUMBER_HEIGHT         = 60;

@interface RecordBottomButtonView () {
    
}
@property (strong, nonatomic) UIButton            *commitButton;
@property (strong, nonatomic) UIButton            *detailButton;

@end

@implementation RecordBottomButtonView

- (instancetype)init
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, FLOAT_NUMBER_HEIGHT);
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor grayColor];
    
    _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _commitButton.frame = CGRectMake(15,15,/*CGRectGetWidth(self.frame)/2*/140, 35);
    [_commitButton setBackgroundColor:[UIColor greenColor]];
    [_commitButton setTitle:@"Commit" forState:UIControlStateNormal];
    [_commitButton addTarget:self action:@selector(commintButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_commitButton];
    
    _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _detailButton.frame = CGRectMake(/*CGRectGetWidth(self.frame)/2 + 15*/170,15, /*CGRectGetWidth(self.frame)/2*/140 , 35);
    [_detailButton setBackgroundColor:[UIColor greenColor]];
    [_detailButton setTitle:@"Check Detail" forState:UIControlStateNormal];
    [_detailButton addTarget:self action:@selector(detailButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_detailButton];

}

- (void)commintButtonPressed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedCommintButton)]) {
        [self.delegate didClickedCommintButton];
    }
}

- (void)detailButtonPressed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedCheckButton)]) {
        [self.delegate didClickedCheckButton];
    }
}

@end
