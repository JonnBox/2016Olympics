//
//  BaseDAO.h
//  PersistenceLayer
//
//  Created by 李振 on 14-6-28.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "DBHelper.h"

@interface BaseDAO : NSObject
{
    sqlite3 * db;
}

// 数据文件全路径
@property (nonatomic, strong) NSString * dbFilePath;

// 打开SQLite数据库。如果返回true表示成功打开，返回false表示打开失败
- (BOOL)openDB;

@end
