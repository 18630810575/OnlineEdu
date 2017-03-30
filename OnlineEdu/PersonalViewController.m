//
//  PersonalViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/28.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

#pragma mark -----lifecycle-----
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavTitleWith:@"我的"];
    [self setBarBtnWithImage:[UIImage imageNamed:@"setting"] SEL:@selector(personalSet)];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
}
#pragma mark -----others-----

#pragma mark -----onclick-----
-(void)personalSet{
    
    NSLog(@"设置");
    
}


#pragma mark -----getters-----


@end
