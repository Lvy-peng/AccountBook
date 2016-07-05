//
//  RecodTableViewCell.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecodTableViewCell.h"

extern NSMutableDictionary    *accountDictionary;


@interface RecodTableViewCell () <UITextViewDelegate>

@end

@implementation RecodTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor grayColor];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 60, 35)];
    nameLabel.text = NSLocalizedString(@"Name:", nil);
    nameLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:nameLabel];
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 15, 60, 35)];
    moneyLabel.text = NSLocalizedString(@"Money:", nil);
    moneyLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:moneyLabel];

    
    _nameText = [[UITextView alloc] initWithFrame:CGRectMake(65, 10, 100, 30)];
    _nameText.backgroundColor = [UIColor greenColor];
    _nameText.delegate = self;
    [self.contentView addSubview:_nameText];
    
    _moneyText = [[UITextView alloc] initWithFrame:CGRectMake(250, 10, 60, 30)];
    _moneyText.backgroundColor = [UIColor greenColor];
    _moneyText.delegate = self;
    [self.contentView addSubview:_moneyText];
    
   // accountDictionary = [[NSMutableDictionary alloc] init];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView {    
    if (textView == _moneyText) {
        [accountDictionary setObject:[NSString stringWithFormat:@"%@",_moneyText.text]forKey:[NSString stringWithFormat:@"%@",_nameText.text]];
    }
}
@end
