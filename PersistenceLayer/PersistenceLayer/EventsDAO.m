//
//  EventsDAO.m
//  PersistenceLayer
//
//  Created by 李振 on 14-6-27.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "EventsDAO.h"

@implementation EventsDAO

// 插入数据的方法
- (int)create:(Events *)model
{
    if ([self openDB]) {
        NSString * sqlStr = @"INSERT INTO Events (EventName, EventIcon, KeyInfo, BasicsInfo, OlympicInfo) VALUES (?, ?, ?, ?, ?)";
        sqlite3_stmt * statement;
        // 预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) != SQLITE_OK) {
            // 绑定参数开始
            sqlite3_bind_text(statement, 1, [model.EventName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.EventIcon UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.EventIcon UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.EventIcon UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.EventIcon UTF8String], -1, NULL);
            // 执行插入
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"插入数据失败。");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}

// 删除数据的方法
- (int)remove:(Events *)model
{
    if ([self openDB]) {
        // 先删除子表（比赛日程表）相关数据
        NSString * sqlScheduleStr = [[NSString alloc] initWithFormat:@"DELETE FROM Schedule WHERE EventID=%i", model.EventID];
        char * err;
        // 开启事务，立刻提交之前的事务
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", NULL, NULL, &err);
        if (sqlite3_exec(db, [sqlScheduleStr UTF8String], NULL, NULL, &err) != SQLITE_OK) {
            // 回滚事务
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(NO, @"删除数据失败。");
        }
        // 先删除主表（比赛项目）数据
        NSString * sqlEventsStr = [[NSString alloc] initWithFormat:@"DELETE FROM Events WHERE EventID=%i", model.EventID];
        if (sqlite3_exec(db, [sqlEventsStr UTF8String], NULL, NULL, &err) != SQLITE_OK) {
            // 回滚事务
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(NO, @"删除数据失败。");
        }
        // 提交事务
        sqlite3_exec(db, "COMMIT TRANSACTION", NULL, NULL, &err);
        sqlite3_close(db);
    }
    return 0;
}

// 修改数据的方法
- (int)modify:(Events *)model
{
    return 0;
}

// 查询所有数据的方法
- (NSMutableArray *)findAll
{
    NSMutableArray * listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        NSString * qsql = @"SELECT EventName, EventIcon, KeyInfo, BasicsInfo, OlympicInfo, EventID FROM Events";
        sqlite3_stmt * statement;
        // 预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, statement, NULL) != SQLITE_OK) {
            // 执行
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Events * events = [[Events alloc] init];
                char * cEventName = (char *)sqlite3_column_text(statement, 0);
                events.EventName = [[NSString alloc] initWithUTF8String:cEventName];
                
                char * cEventIcon = (char *)sqlite3_column_text(statement, 1);
                events.EventIcon = [[NSString alloc] initWithUTF8String:cEventIcon];
                
                char * cKeyInfo = (char *)sqlite3_column_text(statement, 2);
                events.KeyInfo = [[NSString alloc] initWithUTF8String:cKeyInfo];
                
                char * cBasicsInfo = (char *)sqlite3_column_text(statement, 3);
                events.BasicsInfo = [[NSString alloc] initWithUTF8String:cBasicsInfo];
                
                char * cOlympicInfo = (char *)sqlite3_column_text(statement, 4);
                events.OlympicInfo = [[NSString alloc] initWithUTF8String:cOlympicInfo];
                
                events.EventID = sqlite3_column_int(statement, 5);
                
                [listData addObject:events];
            }
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return listData;
}

// 按照主键查询数据的方法
- (Events *)findById:(Events *)model
{
    return nil;
}

@end
























