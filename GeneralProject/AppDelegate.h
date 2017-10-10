//
//  AppDelegate.h
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import <UIKit/UIKit.h>
#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) BaseTabBarViewController *rootMainViewController;

@end

