//
//  ViewController.m
//  起来米汇
//
//  Created by Hanxiaojie on 2017/9/10.
//
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarViewController.h"
#import "GeneralWebViewController.h"

@interface ViewController ()

@property (nonatomic, strong) BaseTabBarViewController *rootMainViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self requestNetwork];
    
}



- (void)requestNetwork {
    
    NSString *candidate = @"http://144.48.220.66:8080/AndroidService/redirect";
    NSURL *url = [NSURL URLWithString:candidate];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"HEAD"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error %@",error);
//        block()
        if (!request && error) {
            NSLog(@"不可用");
        }else{
            NSLog(@"可用%@",request);
        }
    }];
    [task resume];
    
//    [NetworkingSessionManager validateUrl:url callback:^(BOOL available) {
//        if (available == YES) {
//            
//        }else{
//            
//        }
//    }];
    
    
    return;
    [NetworkingSessionManager GET:url parameters: [NSDictionary dictionary] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        GeneralWebViewController * about = [[GeneralWebViewController alloc] initWithUrl:url];
        [self presentViewController:about animated:false completion:nil];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //http://144.48.220.66:8080/AndroidService/redirect
        /////////////////////tmp
        [self presentViewController:self.rootMainViewController animated:false completion:nil];
        if (error.code == NSURLErrorCannotFindHost) {   //404 打开静态页面
            [self presentViewController:self.rootMainViewController animated:false completion:nil];
        }
        //如果是链接不上网络的原因导致请求失败, 每0.5s重新请求一次, 因为ios10以上首次打开app, 用户授权网络之前请求会失败!!!
        else if (error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorNetworkConnectionLost) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self requestNetwork];
            });
        }
        else{
            
        }
    }];
}



- (BaseTabBarViewController *)rootMainViewController
{
    if(!_rootMainViewController)
    {
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        
        
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        
        
        ThreeViewController *thirdVC = [[ThreeViewController alloc] init];
        
        
        FourViewController *fourthVC = [[FourViewController alloc] init];
        
        
        BaseNavigationViewController *oneNav = [[BaseNavigationViewController alloc] initWithRootViewController:firstVC];
        NSLog(@"%@",[UIImage imageNamed:@"timg"]);
        [oneNav setTitle:@"首页" andImage:@"home" andSelectedImage:@"home1"];
        oneNav.tabBarItem.tag = 1;
//        BaseNavigationViewController *twoNav = [[BaseNavigationViewController alloc] initWithRootViewController:secondVC];
//        [twoNav setTitle:@"行情" andImage:@"deal" andSelectedImage:@"deal1"];
//        twoNav.tabBarItem.tag = 2;
        BaseNavigationViewController *threeNav = [[BaseNavigationViewController alloc] initWithRootViewController:thirdVC];
        [threeNav setTitle:@"速递" andImage:@"discovery" andSelectedImage:@"discovery1"];
        threeNav.tabBarItem.tag = 2;
        BaseNavigationViewController *fourNav = [[BaseNavigationViewController alloc] initWithRootViewController:fourthVC];
        [fourNav setTitle:@"更多" andImage:@"me" andSelectedImage:@"me1"];
        fourNav.tabBarItem.tag = 3;
        
        BaseTabBarViewController *tabBarViewController = [[BaseTabBarViewController alloc] init];
        tabBarViewController.tabBar.backgroundColor = [UIColor whiteColor];
        [tabBarViewController setViewControllers:@[oneNav, threeNav, fourNav]];
        
        _rootMainViewController = tabBarViewController;
    }
    return _rootMainViewController;
}

@end
