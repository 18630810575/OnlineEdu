//
//  CourseInfoViewCell.h
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/5.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseInfoViewCell : UITableViewCell
@property (strong,nonatomic)UILabel* courseNameLabel;
@property (strong,nonatomic)UILabel* dateLabel;
@property (strong,nonatomic)UIButton* courseTypeBtn;
@property (strong,nonatomic)UIButton* studyTimeBtn;
@property (strong,nonatomic)UIButton* studyBtn;
@property (strong,nonatomic)UIButton* favourBtn;
@end
