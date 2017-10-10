//
//  BaseViewController.m
//  旅业圈
//
//  Created by wangDC on 2017/3/27.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImage *image = [UIImage new];
//    [self.navigationController.navigationBar setBackgroundImage:image
//                                                  forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:image];
    
    
    
//    self.navigationItem.titleView = self.centerTitleLabel;
    
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = UIColorFromRGB(0xf1f1f1);

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
 

    
    //设置返回按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 44, 44);
    button.titleLabel.font = UIFont(16);
    [button setImage:[UIImage imageNamed:@"back-icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //控制器侧滑（边缘侧滑）
    [self lateralSpreads];
}

- (void) setNavigationBarColor:(UIColor *) color
{
    self.navigationController.navigationBar.barTintColor = color;
}

//设置左按钮
- (void) setLeftButtonText:(NSString * ) text
{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 44, 44);
    button.titleLabel.font = UIFont(16);
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
    
}
- (void) setLeftButtonImage:(NSString * ) image
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 44, 44);
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
    
}
- (void) hiddenLeftButton
{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
}
- (void) leftButtonClicked:(UIButton *) button
{
    NSLog(@"返回到上一界面");
    PopViewController;
}
//设置右按钮
- (void) setRightButtonText:(NSString * ) text
{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(0, 20, 44, 44);
    _rightBtn.titleLabel.font = UIFont(16);
    [_rightBtn setTitle:text forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItem = buttonItem;
}
- (void) setRightButtonImage:(NSString * ) image
{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(0, 20, 44, 44);
    [_rightBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItem = buttonItem;
}
- (void) hiddenRightButton
{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.rightBarButtonItem = nil;
}
- (void) rightButtonClicked:(UIButton *) button
{
    NSLog(@"右按钮点击");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    NSLog(@"控制器%@已经释放", [NSString stringWithUTF8String:object_getClassName(self)]);
}

//控制器侧滑（边缘侧滑）
- (void)lateralSpreads
{
    //设置代理
    self.navigationController.interactivePopGestureRecognizer.delegate =(id)self;
    
    //启用系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    //判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器，这里我的项目是有tabbar，所以在页面切换之间设置是否显示tababr。
    if (self.navigationController.viewControllers.count == 1){
        //将当前导航控制器置空
        self.currentShowVC = Nil;
        //        [SharedAppDelegate setTabBarHidden:NO animated:YES];
        
    }else{
        
        //        如果不是根控制器，就设置当前导航控制器为其本身。
        self.currentShowVC = self;
        //        [SharedAppDelegate setTabBarHidden:YES animated:NO];
        
    }
    
}

//重写侧滑手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer == self.navigationController.interactivePopGestureRecognizer) {
        //        当前导航控制器是根视图控制器
        //the most important
        return (self.currentShowVC == self.navigationController.topViewController);
        //        不要隐藏tabbar
        //        [SharedAppDelegate setTabBarHidden:NO animated:NO];
        
    }
    
    return YES;
    
}

#pragma mark - 控制屏幕旋转
//#pragma mark - 重写屏幕旋转方法
- (BOOL)shouldAutorotate {
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
