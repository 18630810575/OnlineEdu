//
//  teacherCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/3/31.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "TeacherCell.h"

@implementation TeacherCell
-(instancetype)init{
    self = [super init];
    [self setView];
    return self;
}
-(void)setView{
    self.frame = CGRectMake(0, 0, UIScreenWidth, 191*UIPlanScale900);
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(37*UIPlanScale900, 31*UIPlanScale900, 110*UIPlanScale900, 110*UIPlanScale900)];
    self.headImgView.image = [UIImage imageNamed:@"review"];
    self.headImgView.contentMode = UIViewContentModeScaleToFill;
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.frame.size.height/2;
    [self addSubview:self.headImgView];
    float x = lastRightX(self.headImgView);
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"Branda";
    self.nameLabel.font = [UIFont systemFontOfSize:UI900(28)];
    self.nameLabel.textColor = Text333333Color;
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = CGRectMake(37*UIPlanScale900+x, 50*UIPlanScale900, CGRectGetWidth(self.nameLabel.frame), CGRectGetHeight(self.nameLabel.frame));
    CGRect rect = self.nameLabel.frame;
    rect.origin.x = UI900(37)+x;
    rect.origin.y = UI900(50);
    self.nameLabel.frame = rect;
    [self addSubview:self.nameLabel];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"  金牌讲师  ";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = blueText;
    self.titleLabel.font = [UIFont systemFontOfSize:UI900(20)];
    [self.titleLabel sizeToFit];
    rect = self.titleLabel.frame;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.cornerRadius = rect.size.height/2;
    self.titleLabel.frame = CGRectMake(UI900(11)+CGRectGetMaxX(self.nameLabel.frame), 50*UIPlanScale900, CGRectGetWidth(self.titleLabel.frame), CGRectGetHeight(self.titleLabel.frame));
    [self addSubview:self.titleLabel];
    
    self.rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(UIScreenWidth-UI900(44)-UI900(39), 10, UI900(44), UI900(44))];
    self.rightImgView.image = [UIImage imageNamed:@"rightGo"];
    self.rightImgView.contentMode = UIViewContentModeScaleAspectFit;
    CGPoint p = self.rightImgView.center;
    p.y = self.center.y;
    self.rightImgView.center = p;
    [self addSubview:self.rightImgView];

    
//    self.detailLabel = [[UILabel alloc] init];
//    self.detailLabel.text = @"  金牌讲师  ";
//    self.detailLabel.textColor = [UIColor whiteColor];
//    self.detailLabel.backgroundColor = blueText;
//    self.detailLabel.font = [UIFont systemFontOfSize:UI900(20)];
//    [self.detailLabel sizeToFit];
//    rect = self.detailLabel.frame;
//    self.detailLabel.layer.masksToBounds = YES;
//    self.detailLabel.layer.cornerRadius = rect.size.height/2;
//    self.detailLabel.frame = CGRectMake(UI900(11)+CGRectGetMaxX(self.nameLabel.frame), 50*UIPlanScale900, CGRectGetWidth(self.titleLabel.frame), CGRectGetHeight(self.titleLabel.frame));
//    [self addSubview:self.titleLabel];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
