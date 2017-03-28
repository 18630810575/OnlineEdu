//
//  MainViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getWebInfoDemo];
}


-(void)getWebInfoDemo{

    [WebAgent getUserInfoDemo:@"0000" success:^(id responseObject) {
        NSData *data = [[NSData alloc]initWithData:responseObject];
        NSDictionary *dict= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"0000");
    } failure:^(NSError *error) {
        NSLog(@"1111");
    }];
}


@end
