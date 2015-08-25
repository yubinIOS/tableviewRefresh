//
//  AAAAA.h
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/25.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    headViewStateLastBeforeLoging = 1,
    headViewStateLastStartLoging,
    headViewStateLastLoging,
    headViewStateLastAfterLoging,
} headViewState;


@interface HeadView : UIView

-(void)UpdateHeadViewWithState:(NSInteger)state;

@end
