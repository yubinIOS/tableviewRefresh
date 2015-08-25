//
//  ViewController.m
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/24.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import "ViewController.h"
#import "ListCell.h"
#import "FootView.h"
#import "HeadView.h"


@interface ViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>

@property (nonatomic,strong)UITableView * tableViewList;
@property (nonatomic,strong)NSMutableArray * arrayList;
@property (nonatomic,strong)FootView * footView;
@property (nonatomic,strong)HeadView * headView;
@property (nonatomic,assign)NSInteger theState;
@property (nonatomic,assign)BOOL stateCheck;

@property (nonatomic,assign)BOOL stateHeadCheck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"上拉 下拉";
    
    
    self.tableViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 100) style:UITableViewStylePlain];
    self.tableViewList.delegate = self;
    self.tableViewList.dataSource = self;
    [self.view addSubview:self.tableViewList];
    self.tableViewList.tableFooterView = [UIView new];
    self.footView = [[FootView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50)];
    self.tableViewList.tableFooterView = self.footView;
    self.headView = [[HeadView alloc] initWithFrame:CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, 50)];
    self.tableViewList.tableHeaderView = self.headView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.stateCheck = YES;
    self.stateHeadCheck = YES;

    self.arrayList = [NSMutableArray array];

    for (NSInteger i = 0; i < 15; i++)
    {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[cellIsLast] = @(NO);
        dic[cellTitle] = [NSString stringWithFormat:@"中国队加油%@",@(i*i + 3)];

        [self.arrayList addObject:dic];
    }

    [self.tableViewList reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idCell = @"tableViewList";
    NSInteger row = [indexPath row];
    ListCell * cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    if (cell == nil)
    {
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCell];
    }

    [cell reloadCellData:self.arrayList[row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yPosition = self.tableViewList.contentOffset.y;
    CGFloat yPoint = self.tableViewList.contentSize.height - [UIScreen mainScreen].bounds.size.height;
    

    if (self.stateCheck == YES)
    {
        //上拉加载更多
        if (yPosition > yPoint - 50)
        {
            if (yPosition < yPoint + 30)
            {
                if (self.theState != viewStateLastBeforeLoging)
                {
                    self.theState = viewStateLastBeforeLoging;
                    [self.footView UpdateViewWithState:self.theState];
                }
            }
            else
            {
                if (self.theState != viewStateLastLoging)
                {
                    self.theState = viewStateLastLoging;
                    [self.footView UpdateViewWithState:self.theState];
                }
            }
        }
        
    }
    
    if (self.stateHeadCheck == YES)
    {
        //下拉刷新
        if (yPosition < 0.001f)
        {
            if (yPosition > -150.0f)
            {
                if (self.theState != headViewStateLastBeforeLoging)
                {
                    self.theState = headViewStateLastBeforeLoging;
                    [self.headView UpdateHeadViewWithState:self.theState];
                }
            }
            else
            {
                if (self.theState != headViewStateLastStartLoging)
                {
                    self.theState = headViewStateLastStartLoging;
                    [self.headView UpdateHeadViewWithState:self.theState];
                }
            }
        }
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGFloat yPosition = self.tableViewList.contentOffset.y;

    if (yPosition < -50)
    {
        
        if (self.theState == headViewStateLastStartLoging)
        {
            self.theState = headViewStateLastLoging;
            [self.headView UpdateHeadViewWithState:self.theState];

            self.stateHeadCheck = NO;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.tableViewList.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 50);
                
            } completion:nil];
        }
    }
    else
    {
        if (self.theState == viewStateLastLoging)
        {
            self.stateCheck = NO;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.tableViewList.frame = CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 50);
                
            } completion:nil];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat yPosition = self.tableViewList.contentOffset.y;
    
    if (yPosition < -50)
    {
        if (self.theState == headViewStateLastLoging)
        {
            self.stateHeadCheck = NO;
            
            self.theState = headViewStateLastLoging;
            [self.headView UpdateHeadViewWithState:self.theState];
            
            [self performSelector:@selector(upDateList) withObject:self afterDelay:2.0f];
        }
    }
    else
    {
        if (self.theState == viewStateLastLoging)
        {
            self.stateCheck = NO;
            
            self.theState = viewStateLastLoging;
            [self.footView UpdateViewWithState:self.theState];
            
            [self performSelector:@selector(upDataMore) withObject:self afterDelay:2.0f];
        }
    }
}

-(void)upDataMore
{
    int32_t value = arc4random();
    if (value % 5 > 3)
    {
        self.theState = viewStateLastNull;
        [self.footView UpdateViewWithState:self.theState];

        [self performSelector:@selector(tableviewListUpdate) withObject:self afterDelay:1];
        
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.tableViewList.frame = CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+100);
            self.theState = viewStateLastAfterLoging;
            [self.footView UpdateViewWithState:self.theState];
            self.stateCheck = YES;
            
        } completion:nil];
        
    }

}

-(void)tableviewListUpdate
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.tableViewList.frame = CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+100);
        self.stateCheck = YES;
        
    } completion:nil];
    

}

-(void)upDateList
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.tableViewList.frame = CGRectMake(0,-50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+100);
        self.theState = headViewStateLastAfterLoging;
        [self.headView UpdateHeadViewWithState:self.theState];
        self.stateHeadCheck = YES;
        
    } completion:nil];
}

@end

