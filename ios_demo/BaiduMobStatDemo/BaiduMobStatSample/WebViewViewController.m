//
//  WebViewViewController.m
//  BaiduMobStatSample
//
//  Created by Lidongdong on 9/23/14.
//
//

#import "WebViewViewController.h"
#import "BaiduMobStat.h"


@interface WebViewViewController ()<UIWebViewDelegate>

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * Web = [[UIWebView alloc] init];
    Web.delegate = self;
    Web.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    Web.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:Web];
    [Web release];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"mobstat" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [Web loadRequest:request];
    // Do any additional setup after loading the view.
}

//实现WebView的代理方法，并在此函数中调用SDK的webviewStartLoadWithRequest:传入request参数，进行统计
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [[BaiduMobStat defaultStat] webviewStartLoadWithRequest:request];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
