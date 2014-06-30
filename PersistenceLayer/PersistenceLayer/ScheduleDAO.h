//
//  ScheduleDAO.h
//  PersistenceLayer
//
//  Created by 李振 on 14-6-29.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDAO.h"
#import "Schedule.h"
#import "Events.h"

// 比赛日程表 数据访问对象类
@interface ScheduleDAO : BaseDAO

+ (ScheduleDAO *)sharedManager;

// 插入数据的方法
- (int)create:(Schedule *)model;

// 删除数据的方法
- (int)remove:(Schedule *)model;

// 修改数据的方法
- (int)modify:(Schedule *)model;

// 查询所有数据的方法
- (NSMutableArray *)findAll;

// 按照主键查询数据的方法
-(Schedule *)findById:(Schedule *)model;

@end
