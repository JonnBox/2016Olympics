//
//  EventsViewController.m
//  2016Olympics
//
//  Created by 李振 on 14-7-2.
//  Copyright (c) 2014年 Lee Zhen. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

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
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // 如果是iPhone设备，列数为2
        COL_COUNT = 2;
    } else {
        // 如果是iPad设备，列数为5
        COL_COUNT = 5;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.events == nil || [self.events count] == 0) {
        EventsBL * bl = [[EventsBL alloc] init];
        // 获取全部数据
        NSMutableArray * array = [bl readData];
        self.events = array;
        [self.collectionView reloadData];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.events count] / COL_COUNT;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return COL_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventsViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Events * event = [self.events objectAtIndex:(indexPath.section * COL_COUNT + indexPath.row)];
    cell.imageView.image = [UIImage imageNamed:event.EventIcon];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath * indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        Events * event = [self.events objectAtIndex:(indexPath.section * COL_COUNT + indexPath.row)];
        EventsDetailViewController_iPad * detailVC = [segue destinationViewController];
        detailVC.events = event;
    }
}

@end
