//
//  RecordChooseNumView.m
//  AccountBook
//
//  Created by PZM on 26/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordChooseNumView.h"

@interface RecordChooseNumView () {
    UILabel     *_pleaseInputLabel;
    UIButton    *_confirmButton;
}

@end

@implementation RecordChooseNumView

- (instancetype)init {
    CGRect fream = CGRectMake(50, 120, 220, 200);

    if (self = [super initWithFrame:fream]) {
        [self setUpView];
    }
    
    return self;
}

- (void)setUpView {
    self.backgroundColor = [UIColor grayColor];
    int originY = 15;
    _pleaseInputLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,originY , 220, 50)];
    _pleaseInputLabel.textAlignment = NSTextAlignmentCenter;
    _pleaseInputLabel.text = NSLocalizedString(@"Please Enter your Number:", nil);
    _pleaseInputLabel.textColor = [UIColor greenColor];
    [self addSubview:_pleaseInputLabel];
    
    int originX = 70;
    originY = 80;
    _inputNumText = [[UITextView alloc] initWithFrame:CGRectMake(originX, originY, 100, 30)];
    _inputNumText.backgroundColor = [UIColor greenColor];
    [self addSubview:_inputNumText];
    
    originY = 110;
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _confirmButton.frame = CGRectMake(40,originY + 20 , 150, 30);
    _confirmButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_confirmButton setTitle:NSLocalizedString(@"confirm", nil) forState:UIControlStateNormal];
    [_confirmButton setBackgroundColor:[UIColor greenColor]];
    [_confirmButton addTarget:self action:@selector(confirmButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmButton];
    
}

- (void)confirmButtonPressed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedConfirmButton)]) {
        [self.delegate didClickedConfirmButton];
    }
}

@end
