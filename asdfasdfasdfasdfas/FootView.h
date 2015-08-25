//
//  AAAAA.h
//  asdfasdfasdfasdfas
//
//  Created by ZNM_YuBin on 15/8/25.
//  Copyright (c) 2015年 YuBin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    viewStateLastBeforeLoging = 1,
    viewStateLastLoging,
    viewStateLastAfterLoging,
    viewStateLastNull,
} viewState;


@interface FootView : UIView

-(void)UpdateViewWithState:(NSInteger)state;

@end
