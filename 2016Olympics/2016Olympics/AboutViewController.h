//
//  AboutViewController.h
//  2016Olympics
//
//  Created by 李振 on 14-7-3.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

#define kSampleAdUnitID @"ca-app-pub-2104595792319883/5627898450"

@interface AboutViewController : UIViewController <GADBannerViewDelegate>

@property (strong, nonatomic) GADBannerView * bannerView;

- (GADRequest *)createRequest;

@end
