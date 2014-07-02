//
//  EventsBL.h
//  BusinessLogicLayer
//
//  Created by 李振 on 14-7-1.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventsDAO.h"
#import "Events.h"

// 比赛项目业务逻辑类
@interface EventsBL : NSObject

// 查询所有数据的方法
- (NSMutableArray *)readData;

@end
