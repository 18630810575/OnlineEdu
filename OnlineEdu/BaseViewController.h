//
//  BaseViewController.h
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title;
-(void)setNavTitleWith:(NSString*)title;
-(void)setBarBtnWithImage:(UIImage*)image SEL:(SEL)action;
-(void)setBack;
-(void)setShadow:(UIView*)view Opacity:(float)opacity Radius:(float)radius Color:(UIColor*)color;
@end
