//
//  MainViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "MainViewController.h"
#import "HomeNavigationController.h"
#import "HomeViewController.h"
#import "CourseNavigationController.h"
#import "CourseViewController.h"
#import "PersonalNavigationController.h"
#import "PersonalViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getWebInfoDemo];
    [self setVC];
    [self setBar];
}
-(void)setVC{
    HomeViewController* homeVC = [[HomeViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor whiteColor];
    HomeNavigationController* navHomeVC = [[HomeNavigationController alloc] initWithRootViewController:homeVC];
    
    CourseViewController* courseVC = [[CourseViewController alloc] init];
    courseVC.view.backgroundColor = [UIColor whiteColor];
    CourseNavigationController* navCourseVC = [[CourseNavigationController alloc] initWithRootViewController:courseVC];
    
    PersonalViewController* personalVC = [[PersonalViewController alloc] init];
    personalVC.view.backgroundColor = [UIColor whiteColor];
    PersonalNavigationController* navPersonalVC = [[PersonalNavigationController alloc]initWithRootViewController:personalVC];
    
    self.viewControllers = @[navHomeVC,navCourseVC,navPersonalVC];
    
    UIImage *homeImage = [[UIImage imageNamed:@"home2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectHomeImage = [[UIImage imageNamed:@"home1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabbarItem0 = [[UITabBarItem alloc] initWithTitle:@"主页" image:homeImage selectedImage:selectHomeImage];
    
    self.viewControllers[0].tabBarItem = tabbarItem0;
    
    UIImage *couseImage = [[UIImage imageNamed:@"course2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectCouseImage = [[UIImage imageNamed:@"course1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabbarItem1 = [[UITabBarItem alloc] initWithTitle:@"课程" image:couseImage selectedImage:selectCouseImage];
    
    self.viewControllers[1].tabBarItem = tabbarItem1;
    
    UIImage *personalImage = [[UIImage imageNamed:@"personal2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectPersonalImage = [[UIImage imageNamed:@"personal1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabbarItem2 = [[UITabBarItem alloc] initWithTitle:@"我的" image:personalImage selectedImage:selectPersonalImage];
    
    self.viewControllers[2].tabBarItem = tabbarItem2;
    
}
-(void)setBar{
    CGRect rect = CGRectMake(0, 0, UIScreenWidth, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UITabBar appearance] setShadowImage:img];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UINavigationBar appearance].translucent = NO;
    
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10.0f],
                                                        NSForegroundColorAttributeName : RGB(177, 178, 177)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10.0f],
                                                        NSForegroundColorAttributeName : RGB(56, 179, 253)} forState:UIControlStateSelected];
    
    
    
    [self.viewControllers[0].tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-2)];
    [self.viewControllers[1].tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-2)];
    [self.viewControllers[2].tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-2)];
}
-(void)getWebInfoDemo{

    [WebAgent getUserInfoDemo:@"0000" success:^(id responseObject) {
        NSData *data = [[NSData alloc]initWithData:responseObject];
        NSDictionary *dict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"%@", dict[@"message"]);
    } failure:^(NSError *error) {
        NSLog(@"fail");
    }];
}


@end
