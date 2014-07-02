//
//  ScheduleBLTests.m
//  BusinessLogicLayer
//
//  Created by 李振 on 14-7-1.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ScheduleBL.h"
#import "Schedule.h"
#import "ScheduleDAO.h"

@interface ScheduleBLTests : XCTestCase

@property (nonatomic, strong) ScheduleBL * bl;
@property (nonatomic, strong) Schedule * theSchedule;

@end

@implementation ScheduleBLTests

- (void)setUp
{
    // 创建ScheduleBL对象
    self.bl = [ScheduleBL new];
    // 创建Schedule对象
    self.theSchedule = [Schedule new];
    self.theSchedule.GameDate = @"test GameDate";
    self.theSchedule.GameTime = @"test GameTime";
    self.theSchedule.GameInfo = @"test GameInfo";
    Events * event = [Events new];
    event.EventName = @"Cycling Mountain Bike";
    event.EventID = 10;
    self.theSchedule.Event = event;
    
    // 插入测试数据
    ScheduleDAO * dao = [ScheduleDAO sharedManager];
    [dao create:self.theSchedule];
}

- (void)tearDown
{
    // 删除测试数据
    self.theSchedule.ScheduleID = 502;
    ScheduleDAO * dao = [ScheduleDAO sharedManager];
    [dao remove:self.theSchedule];
    
    self.bl = nil;
}

// 测试 按照主键查询数据方法
- (void)testFindAll
{
    NSMutableDictionary * dict = [self.bl readData];
    
    NSArray * allKey = [dict allKeys];
    
    // 断言 查询记录为1
    XCTAssertTrue([allKey count] == 18, @"断言比赛天数");
    
    NSArray * schedules = [dict objectForKey:self.theSchedule.GameDate];
    Schedule * resSchedule = schedules[0];
    // 断言
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate, @"比赛日期测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime, @"比赛时间测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo, @"比赛描述测试失败");
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID, @"比赛项目ID测试失败");
    XCTAssertEqualObjects(self.theSchedule.Event.EventName, resSchedule.Event.EventName, @"比赛项目名称测试失败");
    
}

@end
