//
//  AboutViewController.m
//  2016Olympics
//
//  Created by 李振 on 14-7-3.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设定广告栏屏幕尺寸，实例化GADBannerView
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    // 设置应用发布者ID
    self.bannerView.adUnitID = kSampleAdUnitID;
    // 设置委托
    self.bannerView.delegate = self;
    // 设置广告栏的根视图控制器
    [self.bannerView setRootViewController:self];
    // 竖屏情况下设置广告栏的位置
    self.bannerView.center = CGPointMake(self.view.center.x, kGADAdSizeBanner.size.height / 2);
    [self.view addSubview:self.bannerView];
    // 请求加载广告
    [self.bannerView loadRequest:[self createRequest]];
}

// 创建广告请求
- (GADRequest *)createRequest
{
    GADRequest * request = [GADRequest request];
    return request;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 广告接收成功
- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    NSLog(@"广告接收成功");
}

// 广告接收失败
- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"广告接收失败 %@", [error localizedFailureReason]);
    // 重新请求加载广告
    [self.bannerView loadRequest:[self createRequest]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
