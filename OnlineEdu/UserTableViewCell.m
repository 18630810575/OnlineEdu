//
//  UserTableViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/6.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

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
    self.headImgView = [[UIImageView alloc] init];
    self.headImgView.backgroundColor = [UIColor redColor];
    self.headImgView.layer.cornerRadius = 5;
    [self.contentView addSubview:self.headImgView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:UI1242(38)];
    [self.contentView addSubview:self.nameLabel];
    
    self.nameStr = @"哈哈";
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.nameStr attributes:@{NSForegroundColorAttributeName : Text333333Color, NSParagraphStyleAttributeName: paragraphStyle}];
    self.nameLabel.attributedText = attrString;
    
    
    
    self.levelImgView = [[UIImageView alloc] init];
    self.levelImgView.image = [UIImage imageNamed:@"level1"];
    [self.contentView addSubview:self.levelImgView];
    
    self.studyTimeLabel = [[UILabel alloc] init];
    self.studyTimeLabel.font = [UIFont systemFontOfSize:UI1242(38)];
    [self.contentView addSubview:self.studyTimeLabel];
    
    self.studyTimeStr = @"学习时长  2.5小时";
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:0];
    NSAttributedString* attrString1 = [[NSAttributedString alloc] initWithString:self.studyTimeStr attributes:@{NSForegroundColorAttributeName : Text666666Color, NSParagraphStyleAttributeName: paragraphStyle1}];
    self.studyTimeLabel.attributedText = attrString1;
    
    self.headImgView.sd_layout
    .leftSpaceToView(self.contentView,UI1242(54))
    .topSpaceToView(self.contentView,UI1242(40))
    .widthIs(UI1242(170))
    .autoHeightRatio(1);
    
    self.nameLabel.backgroundColor = [UIColor redColor];
    self.nameLabel.sd_layout
    .topSpaceToView(self.contentView,UI1242(75))
    .leftSpaceToView(self.headImgView,UI1242(49))
    .autoHeightRatio(0);
    self.nameLabel.isAttributedContent = YES;
    
    self.levelImgView.sd_layout
    .leftSpaceToView(self.nameLabel,UI1242(33))
    .widthIs(UI1242(55))
    .autoHeightRatio(1)
    .centerYEqualToView(self.nameLabel);
    
    self.studyTimeLabel.backgroundColor = [UIColor redColor];
    self.studyTimeLabel.sd_layout
    .leftSpaceToView(self.headImgView,UI1242(49))
    .topSpaceToView(self.nameLabel,UI1242(44))
    .rightSpaceToView(self.contentView,60);
//    .heightRatioToView(self.nameLabel,1);
    self.studyTimeLabel.isAttributedContent = YES;
    
    UIView* lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.headImgView,UI1242(40))
    .heightIs(UI1242(27));
    lineView.backgroundColor = UIColorFromRGB(0xf3f6f6);
    
//    [self setupAutoHeightWithBottomView:lineView bottomMargin:0];
    [self setupAutoHeightWithBottomViewsArray:@[lineView,self.studyTimeLabel] bottomMargin:0];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
