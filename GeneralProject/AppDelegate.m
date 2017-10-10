//
//  AppDelegate.m
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = self.rootMainViewController;
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

//- (BaseTabBarViewController *)rootMainViewController
//{
//    if(!_rootMainViewController)
//    {
//        FirstViewController *firstVC = [[FirstViewController alloc] init];
//        
//        
//        SecondViewController *secondVC = [[SecondViewController alloc] init];
//        
//        
//        ThreeViewController *thirdVC = [[ThreeViewController alloc] init];
//        
//        
//        FourViewController *fourthVC = [[FourViewController alloc] init];
//        
//        
//        BaseNavigationViewController *oneNav = [[BaseNavigationViewController alloc] initWithRootViewController:firstVC];
//        NSLog(@"%@",[UIImage imageNamed:@"timg"]);
//        [oneNav setTitle:@"首页" andImage:@"home" andSelectedImage:@"home1"];
//        oneNav.tabBarItem.tag = 1;
//        BaseNavigationViewController *twoNav = [[BaseNavigationViewController alloc] initWithRootViewController:secondVC];
//        [twoNav setTitle:@"行情" andImage:@"deal" andSelectedImage:@"deal1"];
//        twoNav.tabBarItem.tag = 2;
//        BaseNavigationViewController *threeNav = [[BaseNavigationViewController alloc] initWithRootViewController:thirdVC];
//        [threeNav setTitle:@"速递" andImage:@"discovery" andSelectedImage:@"discovery1"];
//        threeNav.tabBarItem.tag = 3;
//        BaseNavigationViewController *fourNav = [[BaseNavigationViewController alloc] initWithRootViewController:fourthVC];
//        [fourNav setTitle:@"更多" andImage:@"me" andSelectedImage:@"me1"];
//        fourNav.tabBarItem.tag = 4;
//        
//        BaseTabBarViewController *tabBarViewController = [[BaseTabBarViewController alloc] init];
//        tabBarViewController.tabBar.backgroundColor = [UIColor whiteColor];
//        [tabBarViewController setViewControllers:@[oneNav, twoNav, threeNav, fourNav]];
//        
//        _rootMainViewController = tabBarViewController;
//    }
//    return _rootMainViewController;
//}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
