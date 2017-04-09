//
//  UserTableViewCell.h
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/6.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (strong,nonatomic)UIImageView* headImgView;
@property (strong,nonatomic)UILabel* nameLabel;
@property (strong,nonatomic)UIImageView* levelImgView;
@property (strong,nonatomic)UILabel* studyTimeLabel;
@property (strong,nonatomic)NSString* nameStr;
@property (strong,nonatomic)NSString* studyTimeStr;
@end
