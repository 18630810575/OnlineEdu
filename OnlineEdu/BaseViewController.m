//
//  BaseViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.view.backgroundColor = UIColorFromRGB(0xF4F5F7);
    }
    return self;
}
-(void)setNavTitleWith:(NSString*)title{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 62, 20)];
    titleLabel.text = title;
    [titleLabel setTextColor:RGB(38, 38, 38)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleLabel;
}
-(void)setRightBarBtnWith:(UIImage*)image action:(id)action{
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    rightBar.tintColor = RGB(166, 166, 166);
    self.navigationItem.rightBarButtonItem = rightBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}



@end
