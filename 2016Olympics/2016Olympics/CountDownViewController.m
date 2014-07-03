//
//  CountDownViewController.m
//  2016Olympics
//
//  Created by 李振 on 14-7-3.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "CountDownViewController.h"

@interface CountDownViewController ()

@end

@implementation CountDownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 创建NSDateComponents对象
    NSDateComponents * comps = [[NSDateComponents alloc] init];
    // 设置NSDateComponents中的日期
    [comps setDay:5];
    // 设置NSDateComponents中的月份
    [comps setMonth:8];
    // 设置NSDateComponents中的年份
    [comps setYear:2016];
    // 创建日历对象
    NSCalendar * calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // 获得2016-8-5的NSDate日期对象
    NSDate * destinationDate = [calender dateFromComponents:comps];
    // 获得当前日期到2016-8-6时间的NSDateComponents对象
    NSDateComponents * components = [calender components:NSDayCalendarUnit fromDate:[NSDate date] toDate:destinationDate options:0];
    // 获得当前日期到2016-8-5相差的天数
    int days = [components day];
    
    NSMutableAttributedString * attributeTextHolder = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%i天", days]];
    
    [attributeTextHolder addAttribute:NSFontAttributeName value:[UIFont preferredFontForTextStyle:UIFontTextStyleBody] range:NSMakeRange(attributeTextHolder.length - 1, 1)];
    
    self.lblCountDown.attributedText = attributeTextHolder;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
