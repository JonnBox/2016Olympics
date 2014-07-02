//
//  ScheduleBL.h
//  BusinessLogicLayer
//
//  Created by 李振 on 14-7-1.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScheduleDAO.h"
#import "Schedule.h"
#import "EventsDAO.h"
#import "Events.h"

@interface ScheduleBL : NSObject

// 查询所有数据方法
- (NSMutableDictionary *)readData;

@end
