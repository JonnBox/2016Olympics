//
//  ScheduleBL.m
//  BusinessLogicLayer
//
//  Created by 李振 on 14-7-1.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "ScheduleBL.h"
#import "EventsBL.h"

@implementation ScheduleBL

// 查询所有数据的方法
- (NSMutableDictionary *)readData
{
    ScheduleDAO * scheduleDAO = [ScheduleDAO sharedManager];
    
    NSMutableArray * schedules = [scheduleDAO findAll];
    NSMutableDictionary * resDict = [[NSMutableDictionary alloc] init];
    
    EventsDAO * eventDAO = [EventsDAO sharedManager];
    // 延迟加载Events数据
    for (Schedule * schedule in schedules) {
        Events * event = [eventDAO findById:schedule.Event];
        schedule.Event = event;
        
        NSArray * allKey = [resDict allKeys];
        
        // 把NSMutableArray结构转化为NSMutableDictionary结构
        if ([allKey containsObject:schedule.GameDate]) {
            NSMutableArray * value = [resDict objectForKey:schedule.GameDate];
            [value addObject:schedule];
        } else {
            NSMutableArray * value = [[NSMutableArray alloc] init];
            [value addObject:schedule];
            [resDict setObject:value forKey:schedule.GameDate];
        }
    }
    return resDict;
}

@end
