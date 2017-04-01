//
//  BaseViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

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
-(void)setBarBtnWithImage:(UIImage*)image SEL:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 18, 18);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:action
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}
-(void)setbackBtnWithImage:(UIImage*)image SEL:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 18, 18);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:action
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setBack{
    [self setbackBtnWithImage:[UIImage imageNamed:@"back"] SEL:@selector(back)];
}
-(void)setShadow:(UIView*)view Opacity:(float)opacity Radius:(float)radius Color:(UIColor*)color{
    view.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    view.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    view.layer.shadowRadius = 4;//阴影半径，默认3}
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBack];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: YES];
    if (self.navigationController.viewControllers.count == 1) {
        self.navigationItem.leftBarButtonItem.customView.hidden=YES;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}
@end
