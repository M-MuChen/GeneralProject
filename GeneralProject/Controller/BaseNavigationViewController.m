//
//  BaseNavigationViewController.m
//  旅业圈
//
//  Created by wangDC on 2017/3/28.
//
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 20)];
//    statusBarView.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:statusBarView];  //设置状态栏背景色为黑色
    
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor(64, 164, 229, 1), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor(85, 85, 85, 1), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationBar.barTintColor = UIColorFromRGB(0x39a1e8);
    
    // Do any additional setup after loading the view.
}

- (void) setTitle:(NSString*) title andImage:(NSString * ) img andSelectedImage:(NSString*) selectedImg
{
    self.tabBarItem.title = title;
    self.tabBarItem.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0);
{
    return UIStatusBarStyleBlackOpaque;
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
