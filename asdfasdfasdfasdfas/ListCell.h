//
//  ListCell.h
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/24.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const cellTitle = @"cellTitle";
static NSString * const cellIsLast = @"cellIsLast";
static NSString * const cellState = @"cellState";

@interface ListCell : UITableViewCell

-(void)reloadCellData:(NSDictionary *)dict;

@end
