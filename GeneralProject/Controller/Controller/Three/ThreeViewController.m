//
//  ThreeViewController.m
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import "ThreeViewController.h"
#import "ThreeTableViewCell.h"
#import "GeneralWebViewController.h"
#import "ThreeTableViewCellModel.h"

@interface ThreeViewController () <UITableViewDelegate, UITableViewDataSource>

//刷新表格
@property (nonatomic, strong) UITableView *tableView;

//页数
@property (nonatomic, assign) NSInteger page;

//数据源
@property (nonatomic, strong) NSArray *tableViewDataSource;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"汇金";
    [self hiddenLeftButton];  //隐藏左按钮
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableViewDataSource = [NSArray array];
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
    
//    [self prepareNetwork];
}
- (void ) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}



- (void)prepareNetwork {
    
    [NetworkingSessionManager GET:@"https://m.0033.com/list/gcx/v1/wallstreet_1.xml" parameters: [NSDictionary dictionary] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSDictionary dictionaryWithXMLParser:responseObject];
        NSDictionary *items = [[dict objectForKey:@"pageItems"] objectForKey:@"item"];
//        NSLog(items);
        self.tableViewDataSource = items;
        [self.tableView reloadData];
    } failure:nil];
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
        [_tableView registerClass:[ThreeTableViewCell class] forCellReuseIdentifier:@"ThreeTableViewCell"];
        [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.tableViewDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeTableViewCell"];
    cell.dataDict = self.tableViewDataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *url = [self.tableViewDataSource[indexPath.row] objectForKey:@"url"];
    GeneralWebViewController * about = [[GeneralWebViewController alloc] initWithUrl:url];
    PushViewController(about);
}

- (void) getData {
//    ThreeTableViewCellModel * model0 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model1 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model2 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model3 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model4 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model5 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    ThreeTableViewCellModel * model6 = [[ThreeTableViewCellModel alloc] initWithIconImage:@"" title:@"" content:@""];
//    [self.tableViewDataSource removeAllObjects];
//    [self.tableViewDataSource addObject:model0];
//    [self.tableViewDataSource addObject:model1];
//    [self.tableViewDataSource addObject:model2];
//    [self.tableViewDataSource addObject:model3];
//    [self.tableViewDataSource addObject:model4];
//    [self.tableViewDataSource addObject:model5];
//    [self.tableViewDataSource addObject:model6];
}

- (void) refreshData {
    
    [self prepareNetwork];
    [self endRefreshing];
}

- (void) loadData {
    [self prepareNetwork];
    [self endRefreshing];
}

- (void) endRefreshing {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


@end
