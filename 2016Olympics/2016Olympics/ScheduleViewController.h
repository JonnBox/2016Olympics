//
//  ScheduleViewController.h
//  2016Olympics
//
//  Created by 李振 on 14-7-3.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
#import "ScheduleBL.h"
#import "EventsDetailViewController.h"

@interface ScheduleViewController : UITableViewController

// 表视图使用的数据
@property (strong, nonatomic) NSDictionary * data;

// 比赛日期列表
@property (strong, nonatomic) NSArray * arrayGameDateList;

@end
