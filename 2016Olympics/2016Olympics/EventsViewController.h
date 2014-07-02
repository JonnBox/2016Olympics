//
//  EventsViewController.h
//  2016Olympics
//
//  Created by 李振 on 14-7-2.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsViewCell.h"
#import "EventsBL.h"
#import "Events.h"
#import "EventsDetailViewController.h"

@interface EventsViewController : UICollectionViewController
{
    // 一行中的列数
    NSUInteger COL_COUNT;
}

@property (strong, nonatomic) NSArray * events;

@end
