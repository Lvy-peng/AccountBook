//
//  RecordDetailViewController.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "RecordDetailViewController.h"
#import "RecordDetailCellTableViewCell.h"

static const int   RECORD_CELL_HEADER_HEIGHT   = 0.0000001;

static NSString   *RecoerdDetailCellInentifier = @"RecoerdetailDCellInentifier";


@interface RecordDetailViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *detailTableView;
@end

@implementation RecordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView {
    self.title = NSLocalizedString(@"Account Detail", nil);
    self.view.backgroundColor = [UIColor grayColor];
    
    _detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    _detailTableView.dataSource = self;
    _detailTableView.delegate = self;
    [self.view addSubview:_detailTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordDetailCellTableViewCell *cell = (RecordDetailCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:RecoerdDetailCellInentifier ];
    
    if (!cell) {
        cell = [[RecordDetailCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RecoerdDetailCellInentifier];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return RECORD_CELL_HEADER_HEIGHT;
}




@end
