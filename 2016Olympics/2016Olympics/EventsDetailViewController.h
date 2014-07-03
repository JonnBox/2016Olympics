//
//  EventsDetailViewController.h
//  2016Olympics
//
//  Created by 李振 on 14-7-2.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface EventsDetailViewController : UIViewController

@property (nonatomic, strong) Events * event;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *lblEventName;

@property (weak, nonatomic) IBOutlet UIImageView *imgEventIcon;

@property (weak, nonatomic) IBOutlet UITextView *txtViewKeyInfo;

@property (weak, nonatomic) IBOutlet UITextView *txtViewBasicsInfo;

@property (weak, nonatomic) IBOutlet UITextView *txtViewOlympicInfo;

@end
