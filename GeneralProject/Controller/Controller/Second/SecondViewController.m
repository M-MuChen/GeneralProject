//
//  SecondViewController.m
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import "SecondViewController.h"
#import "SecondTableViewCell.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

//刷新表格
@property (nonatomic, strong) UITableView *tableView;

//页数
@property (nonatomic, assign) NSInteger page;

//数据源
@property (nonatomic, strong) NSMutableArray *tableViewDataSource;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"汇金";
    [self hiddenLeftButton];  //隐藏左按钮
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableViewDataSource = [NSMutableArray arrayWithCapacity:1];
    self.page = 1;
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoStateFooter  footerWithRefreshingBlock:^{
        
        [weakSelf loadData];
        
    }];
    [self.view addSubview:self.tableView];
    [self.tableView.mj_header beginRefreshing];
    
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"SecondTableViewCell"];
        [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    return _tableView;
}

//- (void)generateData {
//    
//    NSArray *titles = @[@"黄金", @"白银", @"美元指数", @"美原油", @"纸黄金", @"纸白银", @"Au(T+D)", @"Ag((T+D))", @"现货白银", @"现货铂金", @"现货铜", @"现货铝"];
//    NSArray *princes = @[@"1333.98", @"17.85", @"47.42", @"280.66", @"3.75", @"92.65"];
//    NSArray *precents = [];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCell"];
    return cell;
}

- (void) refreshData {
    [self endRefreshing];
}

- (void) loadData {
    [self endRefreshing];
}

- (void) endRefreshing {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
