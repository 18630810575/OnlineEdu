//
//  CourseInfoViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/5.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "CourseInfoViewCell.h"

@implementation CourseInfoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)setView{

    self.courseNameLabel = [[UILabel alloc] init];
    self.courseNameLabel.numberOfLines = 0;
    [self.contentView addSubview:self.courseNameLabel];
    self.courseNameLabel.sd_layout
    .leftSpaceToView(self.contentView,UI900(33))
    .topSpaceToView(self.contentView,UI900(40))
    .rightSpaceToView(self.contentView,0.4*UIScreenWidth)
    .maxWidthIs(0.6*UIScreenWidth)
    .autoHeightRatio(0);
    self.courseNameLabel.text = @"客服系统运维系统班";
    self.courseNameLabel.textColor = Text333333Color;
    self.courseNameLabel.font = [UIFont systemFontOfSize:UI900(41)];


    self.dateLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.dateLabel];
    self.dateLabel.sd_layout
    .leftSpaceToView(self.courseNameLabel,5)
    .topSpaceToView(self.contentView,UI900(40)+UI900(3))
//    .centerYEqualToView(self.courseNameLabel)
    .rightSpaceToView(self.contentView,UI900(38));
    self.dateLabel.text = @"2017-12-12 12:12";
    self.dateLabel.textColor = Text666666Color;
    self.dateLabel.textAlignment = 2;
    self.dateLabel.font = [UIFont systemFontOfSize:UI900(30)];
    
    
    self.courseTypeBtn = [[UIButton alloc] init];
    [self.courseTypeBtn setImage: [UIImage imageNamed:@"courseType"] forState:UIControlStateNormal];
    [self.courseTypeBtn setTitle:@" 123" forState:UIControlStateNormal];
    self.courseTypeBtn.titleLabel.font = [UIFont systemFontOfSize:UI900(30)];
    [self.courseTypeBtn setTitleColor:UIColorFromRGB(0xb7b7b7) forState:UIControlStateNormal];
    self.courseTypeBtn.adjustsImageWhenHighlighted = NO;
    
    self.studyTimeBtn = [[UIButton alloc] init];
    [self.studyTimeBtn setImage: [UIImage imageNamed:@"studyTime"] forState:UIControlStateNormal];
    [self.studyTimeBtn setTitle:@" 123" forState:UIControlStateNormal];
    self.studyTimeBtn.titleLabel.font = [UIFont systemFontOfSize:UI900(30)];
    [self.studyTimeBtn setTitleColor:UIColorFromRGB(0xb7b7b7) forState:UIControlStateNormal];
    self.studyTimeBtn.adjustsImageWhenHighlighted = NO;
    
    self.studyBtn = [[UIButton alloc] init];
    [self.studyBtn setImage: [UIImage imageNamed:@"study"] forState:UIControlStateNormal];
    [self.studyBtn setTitle:@" 123" forState:UIControlStateNormal];
    self.studyBtn.titleLabel.font = [UIFont systemFontOfSize:UI900(30)];
    [self.studyBtn setTitleColor:UIColorFromRGB(0xb7b7b7) forState:UIControlStateNormal];
    self.studyBtn.adjustsImageWhenHighlighted = NO;
    
    self.favourBtn = [[UIButton alloc] init];
    [self.favourBtn setImage: [UIImage imageNamed:@"favour"] forState:UIControlStateNormal];
    [self.favourBtn setTitle:@" 123" forState:UIControlStateNormal];
    self.favourBtn.titleLabel.font = [UIFont systemFontOfSize:UI900(30)];
    [self.favourBtn setTitleColor:UIColorFromRGB(0xb7b7b7) forState:UIControlStateNormal];
    self.favourBtn.adjustsImageWhenHighlighted = NO;
    
    [self.contentView addSubview:self.courseTypeBtn];
    [self.contentView addSubview:self.studyTimeBtn];
    [self.contentView addSubview:self.studyBtn];
    [self.contentView addSubview:self.favourBtn];

    self.courseTypeBtn.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.courseNameLabel,0)
    .widthIs(UIScreenWidth/4)
    .heightIs(UI900(108));
    
    self.studyTimeBtn.sd_layout
    .leftSpaceToView(self.courseTypeBtn,0)
    .topEqualToView(self.courseTypeBtn)
    .widthIs(UIScreenWidth/4)
    .heightIs(UI900(108));

    self.studyBtn.sd_layout
    .leftSpaceToView(self.studyTimeBtn,0)
    .topEqualToView(self.courseTypeBtn)
    .widthIs(UIScreenWidth/4)
    .heightIs(UI900(108));
    
    self.favourBtn.sd_layout
    .leftSpaceToView(self.studyBtn,0)
    .topEqualToView(self.courseTypeBtn)
    .widthIs(UIScreenWidth/4)
    .heightIs(UI900(108));
    
    
    
    UIView* lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.courseTypeBtn,0)
    .heightIs(UI900(15));
    lineView.backgroundColor = UIColorFromRGB(0xf0f0f0);
    
    [self setupAutoHeightWithBottomView:lineView bottomMargin:0];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
