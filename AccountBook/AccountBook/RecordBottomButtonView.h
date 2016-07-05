//
//  RecordBottomButtonView.h
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecordButtonViewDelegate <NSObject>

@optional

- (void)didClickedCommintButton;
- (void)didClickedCheckButton;

@end

@interface RecordBottomButtonView : UIView

@property (weak,nonatomic) id<RecordButtonViewDelegate> delegate;

@end
