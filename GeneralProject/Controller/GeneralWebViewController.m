//
//  GeneralWebViewController.m
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "GeneralWebViewController.h"

@interface GeneralWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView * webView;
@property (strong, nonatomic) NSURLCache *urlCache;
@property (strong, nonatomic) NSMutableURLRequest *request;
@property (copy, nonatomic) NSString *urlStr;
@end

@implementation GeneralWebViewController

- (instancetype) initWithUrl:(NSString *) url {
    self = [super init];
    if (self) {
        self.urlStr = url;
    }
    return self;
}
- (instancetype) initWithHtml:(NSString *) html {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    //setUI
    CGRect frame = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT);
    _webView = [[UIWebView alloc] initWithFrame:frame];
    _webView.scalesPageToFit = YES;
    _webView.scrollView.bounces = NO ;
    [self.view addSubview:_webView];
    
    self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:3600*24*7];
    
    //从请求中获取缓存输出
    NSCachedURLResponse * response = [self.urlCache cachedResponseForRequest:self.request];
    
    //判断是否有缓存
    if (response != nil){
        NSLog(@"如果有缓存输出，从缓存中获取数据");
        [self.request setCachePolicy:NSURLRequestReturnCacheDataDontLoad];
    }
    
    [self.webView loadRequest:self.request];
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showMessage:@"正在载入..." toView:self.view];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD showSuccess:@"载入成功"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD showError:@"载入失败"];
}

- (void) leftButtonClicked:(UIButton *) button
{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
