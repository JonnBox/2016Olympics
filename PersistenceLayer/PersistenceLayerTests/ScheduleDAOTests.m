//
//  ScheduleDAOTests.m
//  PersistenceLayer
//
//  Created by 李振 on 14-6-30.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Schedule.h"
#import "ScheduleDAO.h"

@interface ScheduleDAOTests : XCTestCase

@property (nonatomic, strong) ScheduleDAO * dao;
@property (nonatomic, strong) Schedule * theSchedule;

@end

@implementation ScheduleDAOTests

- (void)setUp
{
    // 创建ScheduleDAO对象
    self.dao = [ScheduleDAO sharedManager];
    // 创建Schedule对象
    self.theSchedule = [[Schedule alloc] init];
    self.theSchedule.GameDate = @"test GameDate";
    self.theSchedule.GameTime = @"test GameTime";
    self.theSchedule.GameInfo = @"test GameInfo";
    self.theSchedule.Event.EventID = 1;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.dao = nil;
}

// 测试 插入Schedule方法
- (void)test_1_Create
{
    int res = [self.dao create:self.theSchedule];
    // 断言 无异常，返回值为0
    XCTAssertTrue(res == 0, @"数据插入失败");
}

// 测试 按照主键查询数据方法
- (void)test_2_FindById
{
    self.theSchedule.ScheduleID = 502;
    Schedule * resSchedule = [self.dao findById:self.theSchedule];
    // 断言 查询结果非nil
    XCTAssertNotNil(resSchedule, @"查询记录为nil");
    // 断言
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate, @"比赛日期测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime, @"比赛时间测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo, @"比赛描述测试失败");
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID, @"比赛项目测试失败");
    
}

// 测试 查询所有数据方法
- (void)test_3_FindAll
{
    NSArray * listData = [self.dao findAll];
    // 断言 查询记录数为1
    XCTAssertTrue([listData count] == 502, @"查询记录数期望值为：502 实际值为：%i", [listData count]);
    
    Schedule *resSchedule = listData[501];
    // 断言
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate, @"比赛日期测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime, @"比赛时间测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo, @"比赛描述测试失败");
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID, @"比赛项目测试失败");
    
}

// 测试 修改Schedule方法
- (void)test_4_Modify
{
    self.theSchedule.ScheduleID = 502;
    self.theSchedule.GameInfo = @"test modify GameInfo";
    
    int res = [self.dao modify:self.theSchedule];
    XCTAssertTrue(res == 0, @"数据修改失败");
    
    Schedule * resSchedule = [self.dao findById:self.theSchedule];
    // 断言 查询结果为非nil
    XCTAssertNotNil(resSchedule, @"查询记录为nil");
    // 断言
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate, @"比赛日期测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime, @"比赛时间测试失败");
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo, @"比赛描述测试失败");
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID, @"比赛项目测试失败");
    
}

// 测试 删除数据方法
-(void)test_5_Remove
{
    int res = [self.dao remove:self.theSchedule];
    // 断言 无异常，返回值为0
    XCTAssertTrue(res == 0, @"数据删除失败");
    Schedule * resSchedule = [self.dao findById:self.theSchedule];
    // 断言 查询结果为nil
    XCTAssertNil(resSchedule, @"记录删除失败");
}

@end













