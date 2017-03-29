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
    
    [self setBarBtn];
    [self setNavTitleWith:@"主页"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBarBtn{
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    rightBar.tintColor = RGB(166, 166, 166);
    self.navigationItem.rightBarButtonItem = rightBar;
}

-(void)search{
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
