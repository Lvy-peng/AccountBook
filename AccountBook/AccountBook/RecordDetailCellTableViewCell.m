//
//  RecordDetailCellTableViewCell.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordDetailCellTableViewCell.h"

extern NSMutableDictionary    *accountDictionary;


@interface RecordDetailCellTableViewCell ()

@property (strong,nonatomic) UILabel *outputNameText;
@property (strong,nonatomic) UILabel *outputMoneyText;

@end

@implementation RecordDetailCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor grayColor];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 60, 35)];
    nameLabel.text = NSLocalizedString(@"Name:", nil);
    nameLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:nameLabel];
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 15, 60, 35)];
    moneyLabel.text = NSLocalizedString(@"Money:", nil);
    moneyLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:moneyLabel];
    
    
    _outputNameText = [[UILabel alloc] initWithFrame:CGRectMake(65, 10, 100, 30)];
    _outputNameText.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_outputNameText];
    
    _outputMoneyText = [[UILabel alloc] initWithFrame:CGRectMake(250, 10, 60, 30)];
    _outputMoneyText.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_outputMoneyText];
     
}

- (void)setAccountDetail:(NSString*)keys{
    //得到词典中所有KEY值
//    NSEnumerator * enumeratorKey = [detailDictionary keyEnumerator];
//    //快速枚举遍历所有KEY的值
//    for (NSObject *object in enumeratorKey) {
//        _outputNameText.text =[NSString stringWithFormat:@"%@",object];
//    }
    _outputNameText.text = [NSString stringWithFormat:@"%@",keys];
    
//    //得到词典中所有Value值
//    NSEnumerator * enumeratorValue = [detailDictionary objectEnumerator];
//    
//    for (NSObject *object in enumeratorValue) {
//        _outputMoneyText.text =[NSString stringWithFormat:@"%@",object];
//    }
//
   // _outputMoneyText.text = [NSString stringWithFormat:@"%d",[num intValue]];

}

- (void)setDetail:(NSNumber *)num {
//    _outputMoneyText.text = [NSString stringWithFormat:@"%d",[num intValue]];
//    //得到词典中所有KEY值
//    NSEnumerator * enumeratorKey = [accountDictionary keyEnumerator];
//    //快速枚举遍历所有KEY的值
//    for (NSObject *object in enumeratorKey) {
//        _outputNameText.text =[NSString stringWithFormat:@"%@",object];
//    }
      _outputMoneyText.text = [NSString stringWithFormat:@"%f",[num floatValue]];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
