//
//  RecordBalanceViewController.m
//  AccountBook
//
//  Created by PZM on 18/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordBalanceViewController.h"
#import "RecordDetailCellTableViewCell.h"

extern NSMutableDictionary    *accountDictionary;

static const int   RECORD_CELL_RECTION         = 2;
static const int   RECORD_CELL_HEIGHT          = 45.0f;
static const int   RECORD_CELL_HEADER_HEIGHT   = 0.0000001;

static NSString   *RecoerdCellInentifier       = @"RecoerdCellInentifier";


@interface RecordBalanceViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSMutableDictionary *_detailDictionary;
    int16_t _totailtyNum;
    NSMutableArray *_perAccountArray;
    NSMutableArray *_finalPerAccountArray;    //最终每个人的收入或者支出
}

@property (strong, nonatomic) UITableView *balanceTable;

@end

@implementation RecordBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBalanceView];
    [self checkAccount];
}

-(void)initBalanceView {
    self.title = @"Balance";
    
    _balanceTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    _balanceTable.dataSource = self;
    _balanceTable.delegate = self;
    [self.view addSubview:_balanceTable];
    
    _perAccountArray = [[NSMutableArray alloc] init];
    _finalPerAccountArray = [[NSMutableArray alloc] init];
    _detailDictionary = [[NSMutableDictionary alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkAccount {
    int16_t count = [accountDictionary count];
    
    NSEnumerator * enumeratorKey = [accountDictionary objectEnumerator];
    //快速枚举遍历所有KEY的值
    for (NSObject *object in enumeratorKey) {
        //_outputNameText.text =[NSString stringWithFormat:@"%@",object];
        [_perAccountArray addObject:object];
        _totailtyNum += [(NSNumber *)object intValue];
    }
    int16_t arrayCount = [_perAccountArray count];
    for (int i = 0; i < arrayCount; i ++) {
        float finalMoney;
        NSObject *object = [_perAccountArray objectAtIndex:i];
        int16_t money = [(NSNumber *)object intValue];
        finalMoney = money - _totailtyNum/count ;
        
        NSNumber *final = [NSNumber numberWithFloat:finalMoney];

        [_finalPerAccountArray addObject:final];
    }
    
  //  [_detailDictionary dictionaryWithValuesForKeys:<#(NSArray *)#>]
    
    //[_detailDictionary setValuesForKeysWithDiction];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return RECORD_CELL_RECTION;
    return [accountDictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordDetailCellTableViewCell *cell = (RecordDetailCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:RecoerdCellInentifier];
    
    if(!cell) {
        cell = [[RecordDetailCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RecoerdCellInentifier];
    }
    
    NSArray *keys = [accountDictionary allKeys];
    
    [cell setAccountDetail:keys[indexPath.row]];//
   // [cell setDetail:key];
    [cell setDetail:[_finalPerAccountArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RECORD_CELL_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return RECORD_CELL_HEADER_HEIGHT;
}

@end
