//
//  BaseTabBarViewController.m
//  旅业圈
//
//  Created by wangDC on 2017/3/28.
//
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"

@interface BaseTabBarViewController () <UIAlertViewDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
}
@end
