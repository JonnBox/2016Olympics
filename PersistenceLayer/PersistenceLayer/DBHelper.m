//
//  DBHelper.m
//  PersistenceLayer
//
//  Created by 李振 on 14-6-27.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

// 初始化并加载数据
- (void)initDB
{
    NSString * configTablePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"DBConfig" ofType:@"plist"];
    NSDictionary * configTable = [[NSDictionary alloc] initWithContentsOfFile:configTablePath];
    // 从配置文件获得数据版本号
    NSNumber * dbConfigVersion = [configTable objectForKey:@"DB_VERSION"];
    // 从数据库DBVersionInfo表记录返回的数据库版本号
    int versionNumber = [self dbVersionNumber];
    
    // 版本号不一致
    if ([dbConfigVersion intValue] != versionNumber) {
        NSString * dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        if (sqlite3_open([dbFilePath UTF8String], &db) != SQLITE_OK) {
            sqlite3_close(db);
            NSAssert(NO, @"数据库打开失败。");
        } else {
            // 加载数据到业务表中
            NSLog(@"数据库升级...");
            char * err;
            NSString * createTablePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"create_load" ofType:@"sql"];
            NSString * sql = [[NSString alloc] initWithContentsOfFile:createTablePath encoding:NSUTF8StringEncoding error:nil];
            if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
                NSLog(@"数据库升级失败的原因：%@", [NSMutableString stringWithCString:err encoding:NSUTF8StringEncoding]);
            }
            // 把当前版本号写回到文件中
            NSString * usql = [[NSString alloc] initWithFormat:@"update DBVersionInfo set version_number = %i", [dbConfigVersion intValue]];
            if (sqlite3_exec(db, [usql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
                NSLog(NO, @"更新DBVersionInfo数据失败。");
            }
            sqlite3_close(db);
        }
    }
}

@end
