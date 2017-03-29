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
    [self setBarBtn];
    
}

-(void)setBarBtn{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    
    [button setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(personalSet)
     forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)personalSet{
    NSLog(@"设置");
}
#pragma mark -----onclick-----



#pragma mark -----getters-----


@end
