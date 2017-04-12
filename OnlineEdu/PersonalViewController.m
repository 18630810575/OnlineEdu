//
//  PersonalViewController.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/28.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "PersonalViewController.h"
#import "UserTableViewCell.h"
#import "UserNormalTableViewCell.h"
#import "UserCircleTableViewCell.h"
#import "UserOvalTableViewCell.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

#pragma mark -----lifecycle-----
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavTitleWith:@"我的"];
    [self setBarBtnWithImage:[UIImage imageNamed:@"setting"] SEL:@selector(personalSet)];
    [self setMyTableView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: YES];
}
#pragma mark -----others-----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UITableViewCell* cell;
    if (indexPath.row == 0) {
        UserTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell"];
        cell = cell1;
    }else if (indexPath.row == 1){
        UserNormalTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"UserNormalTableViewCell"];
        cell = cell1;
    }else if (indexPath.row == 2){
        UserCircleTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"UserCircleTableViewCell"];
        cell = cell1;
    }else if (indexPath.row == 3){
        UserOvalTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"UserOvalTableViewCell"];
        cell = cell1;
    }
    
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:UIScreenWidth tableView:tableView];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark -----onclick-----
-(void)personalSet{
    
    NSLog(@"设置");
    
}


#pragma mark -----getters-----
-(void)setMyTableView{
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"UserTableViewCell"];
    [self.tableView registerClass:[UserNormalTableViewCell class] forCellReuseIdentifier:@"UserNormalTableViewCell"];
    [self.tableView registerClass:[UserCircleTableViewCell class] forCellReuseIdentifier:@"UserCircleTableViewCell"];
    [self.tableView registerClass:[UserOvalTableViewCell class] forCellReuseIdentifier:@"UserOvalTableViewCell"];
    
    self.tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,49);
}

@end
