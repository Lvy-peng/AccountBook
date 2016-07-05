//
//  RecordViewController.m
//  AccountBook
//
//  Created by PZM on 17/9/15.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "RecordViewController.h"
#import "RecodTableViewCell.h"
#import "RecordBottomButtonView.h"
#import "RecordDetailViewController.h"
#import "RecordBalanceViewController.h"
#import "DBManager.h"
#import "RecordChooseNumView.h"
#import "sqlite3.h"

static const int   RECORD_CELL_RECTION         = 10;
static const int   RECORD_CELL_HEIGHT          = 45.0f;
static const int   RECORD_CELL_HEADER_HEIGHT   = 0.0000001;
static const int   FLOAT_NUMBER_HEIGHT         = 60;

#define DBNAME    @"personinfo.sqlite"
#define NAME      @"name"
#define MONEY     @"money"
#define TIME      @"time"
#define TABLENAME @"PERSONINFO"

NSMutableDictionary    *accountDictionary;


static NSString   *RecoerdCellInentifier       = @"RecoerdCellInentifier";

@interface RecordViewController () <UITableViewDataSource,UITableViewDelegate,RecordButtonViewDelegate,RecordChooseNumViewDelegae> {
    sqlite3 *db;
    int16_t  _numOfPeoPle;
}

@property (strong, nonatomic) UITableView            *recordTableView;
@property (strong, nonatomic) RecordBottomButtonView *buttonView;
@property (nonatomic, strong) DBManager              *dbManager;
@property (nonatomic, strong) NSArray                *arrPeopleInfo;
@property (nonatomic,strong)  RecordChooseNumView    *chooseNumView;

-(void)loadData;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChooseNumView];
    [self initAccountData];
    
    //self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.sql"];
    [self initDataBase];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Class Method
- (void)initChooseNumView {
    self.title = @"Record";

    _chooseNumView = [[RecordChooseNumView alloc] init];
    _chooseNumView.delegate = self;
    [self.view addSubview:_chooseNumView];
}

- (void)initButtonView {
    _buttonView = [[RecordBottomButtonView alloc] init];
    _buttonView.delegate = self;
    _buttonView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - FLOAT_NUMBER_HEIGHT, CGRectGetWidth(self.view.frame), FLOAT_NUMBER_HEIGHT);
    [self.view addSubview:_buttonView];
}

- (void)initRecordTableView {
    _recordTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - FLOAT_NUMBER_HEIGHT) style:UITableViewStyleGrouped];
    _recordTableView.dataSource = self;
    _recordTableView.delegate = self;
    [self.view addSubview:_recordTableView];
}

- (void)initAccountData {
    accountDictionary = [[NSMutableDictionary alloc] init];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    
}

- (void)initDataBase {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, money INTEGER, time TEXT)";
    [self execSql:sqlCreateTable];
}

-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}

- (void)setDictionary:(NSMutableDictionary *)accountDictionary {
    accountDictionary = accountDictionary;
}

-(void)loadData{
    // Form the query.
    NSString *query = @"select * from peopleInfo";
    
    // Get the results.
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.recordTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // return RECORD_CELL_RECTION;
    //return self.arrPeopleInfo.count;
    return _numOfPeoPle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecodTableViewCell *cell = (RecodTableViewCell *)[tableView dequeueReusableCellWithIdentifier:RecoerdCellInentifier];
    
    if(!cell) {
        cell = [[RecodTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RecoerdCellInentifier];
    }
    
   // [self setAccountDictionary:recordCell.accountDictionary];
    
    return cell;
    
    
//    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
//    
//    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"firstname"];
//    NSInteger indexOfLastname = [self.dbManager.arrColumnNames indexOfObject:@"lastname"];
//    NSInteger indexOfAge = [self.dbManager.arrColumnNames indexOfObject:@"age"];
//    
//    // Set the loaded data to the appropriate cell labels.
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfLastname]];
//    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAge]];
//    
//    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RECORD_CELL_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return RECORD_CELL_HEADER_HEIGHT;
}

#pragma mark - RecordButtonViewDelegate
- (void)didClickedCommintButton {
    RecordBalanceViewController *balanceVC = [[RecordBalanceViewController alloc] init];
   // [balanceVC setAccountBalance:accountDictionary];
    [self.navigationController pushViewController:balanceVC animated:YES];
}

- (void)didClickedCheckButton {
   // RecordDetailViewController *detailVC = [[RecordDetailViewController alloc] init];
   // [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark RecordChooseNumViewDelegate
- (void)didClickedConfirmButton {
    _chooseNumView.alpha = 0;
    NSString *string = _chooseNumView.inputNumText.text;
    
    _numOfPeoPle = [string intValue];
    [self initRecordTableView];
    [self initButtonView];
}
@end
