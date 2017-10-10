//
//  FourViewController.m
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import "FourViewController.h"
#import "AboutViewController.h"

@interface FourViewController () <UITableViewDelegate, UITableViewDataSource>
//刷新表格
@property (nonatomic, strong) UITableView *tableView;

//页数
@property (nonatomic, assign) NSInteger page;

//数据源
@property (nonatomic, strong) NSMutableArray *tableViewDataSource;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hiddenLeftButton];  //隐藏左按钮
    self.navigationItem.title = @"更多";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableViewDataSource = [NSMutableArray arrayWithCapacity:3];
    [self.tableViewDataSource addObject:@"清除缓存"];
    [self.tableViewDataSource addObject:@"关于我们"];
    [self.tableViewDataSource addObject:@"意见反馈"];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void ) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.tableViewDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString * title = self.tableViewDataSource[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * title = self.tableViewDataSource[indexPath.row];
    if ([title isEqualToString:@"清除缓存"]) {
        [MBProgressHUD showError:@"清除成功"];
    }else{
//        [MBProgressHUD showMessage:@"敬请期待"];
        [MBProgressHUD showError:@"敬请期待!"];
    }
//    else if([title isEqualToString:@"关于我们"]){
//        AboutViewController * about = [[AboutViewController alloc] init];
//        PushViewController(about);
//    } else if([title isEqualToString:@"意见反馈"]){
//        
//    }
}
@end
