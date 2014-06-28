//
//  BaseDAO.m
//  PersistenceLayer
//
//  Created by 李振 on 14-6-28.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "BaseDAO.h"

@implementation BaseDAO

- (id)init
{
    self = [super init];
    if (self) {
        self.dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        // 初始化数据库
        DBHelper * dbHelper = [DBHelper new];
        [dbHelper initDB];
    }
    return self;
}

- (BOOL)openDB
{
    if (sqlite3_open([self.dbFilePath UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败。");
        return false;
    }
    return true;
}

@end
