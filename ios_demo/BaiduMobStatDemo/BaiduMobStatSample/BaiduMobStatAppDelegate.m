//
//  BaiduMobStatAppDelegate.m
//  BaiduMobStatSample
//
//  Created by jaygao on 11-11-1.
//  Copyright (c) 2011年 Baidu. All rights reserved.
//

#import "BaiduMobStatAppDelegate.h"
#import "BaiduMobStat.h"
#import "MyPageLogViewController.h"

#define IosAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation BaiduMobStatAppDelegate

@synthesize window = _window;
@synthesize tabbarController;

- (void)dealloc
{
    [_window release];
    [tabbarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    statTracker.enableExceptionLog = YES; // 是否允许截获并发送崩溃信息，请设置YES或者NO
    statTracker.channelId = @"ReplaceMeWithYourChannel";//设置您的app的发布渠道
    statTracker.logStrategy = BaiduMobStatLogStrategyAppLaunch;//根据开发者设定的发送策略,发送日志
    statTracker.logSendInterval = 1;  //为1时表示发送日志的时间间隔为1小时,当logStrategy设置为BaiduMobStatLogStrategyCustom时生效
    statTracker.logSendWifiOnly = NO; //是否仅在WIfi情况下发送日志数据
    statTracker.sessionResumeInterval = 10;//设置应用进入后台再回到前台为同一次session的间隔时间[0~600s],超过600s则设为600s，默认为30s
    statTracker.shortAppVersion  = IosAppVersion; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    statTracker.enableDebugOn = YES; //调试的时候打开，会有log打印，发布时候关闭
    /*如果有需要，可自行传入adid
     NSString *adId = @"";
     if([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f){
     adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
     }
     statTracker.adid = adId;
     */
    [statTracker startWithAppId:@"ReplaceMeWithAppKey"];//设置您在mtj网站上添加的app的appkey,此处AppId即为应用的appKey
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    tabbarController = [[UITabBarController alloc] init];
    
    MyPageLogViewController* v1 = [[[MyPageLogViewController alloc] init] autorelease];
    v1.title = @"Tab1";
    UINavigationController *nv1 = [[UINavigationController alloc] initWithRootViewController:v1];
    
    MyPageLogViewController* v2 = [[[MyPageLogViewController alloc] init] autorelease];
    v2.title = @"Tab2";
    UINavigationController *nv2 = [[UINavigationController alloc] initWithRootViewController:v2];
    
    MyPageLogViewController* v3 = [[[MyPageLogViewController alloc] init] autorelease];
    v3.title = @"Tab3";
    UINavigationController *nv3 = [[UINavigationController alloc] initWithRootViewController:v3];

    MyPageLogViewController* v4 = [[[MyPageLogViewController alloc] init] autorelease];
    v4.title = @"Tab4";
    UINavigationController *nv4 = [[UINavigationController alloc] initWithRootViewController:v4];

    NSArray* items =[NSArray arrayWithObjects:nv1, nv2, nv3, nv4, nil];
    [nv1 release];
    [nv2 release];
    [nv3 release];
    [nv4 release];

    tabbarController.viewControllers = items;
    tabbarController.delegate = self;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    int index = tabBarController.selectedIndex;
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    [statTracker logEvent:@"TabClick3" eventLabel:[NSString stringWithFormat: @"Tab%d", index]];
}    

@end
