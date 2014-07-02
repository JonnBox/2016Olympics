//
//  EventsBL.m
//  BusinessLogicLayer
//
//  Created by 李振 on 14-7-1.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "EventsBL.h"

@implementation EventsBL

// 查询所有数据方法
- (NSMutableArray *)readData
{
    EventsDAO * dao = [EventsDAO sharedManager];
    NSMutableArray * list = [dao findAll];
    return list;
}

@end
