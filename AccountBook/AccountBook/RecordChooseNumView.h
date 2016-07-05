//
//  RecordChooseNumView.h
//  AccountBook
//
//  Created by PZM on 26/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecordChooseNumViewDelegae <NSObject>

@optional

- (void)didClickedConfirmButton;

@end

@interface RecordChooseNumView : UIView

@property (nonatomic, strong) UITextView  *inputNumText;
@property (weak, nonatomic) id<RecordChooseNumViewDelegae> delegate;

@end
