//
//  HomeViewController.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/3/23.
//  Copyright © 2017年 gaodehao. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 62, 20)];
    titleLabel.text = @"主页";
    [titleLabel setTextColor:RGB(38, 38, 38)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleLabel;
    
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    rightBar.tintColor = RGB(166, 166, 166);
    self.navigationItem.rightBarButtonItem = rightBar;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)search{
    NSLog(@"搜索");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
