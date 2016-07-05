//
//  RecordDetailCellTableViewCell.h
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordDetailCellTableViewCell : UITableViewCell

//- (void)setAccountDetail:(NSMutableDictionary*)detailDictionary;
- (void)setAccountDetail:(NSArray*)detailDictionary;
- (void)setDetail:(NSNumber *)num;

@end
