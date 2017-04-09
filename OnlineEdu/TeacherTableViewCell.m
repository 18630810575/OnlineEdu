//
//  TeacherTableViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/5.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "TeacherTableViewCell.h"

@implementation TeacherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setView];
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
    
    self.headImgView.image = [UIImage imageNamed:@"review"];
    self.headImgView.contentMode = UIViewContentModeScaleToFill;
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.frame.size.height/2;
    [self.contentView addSubview:self.headImgView];
    self.headImgView.sd_layout
    .leftSpaceToView(self.contentView,UI900(37))
    .topSpaceToView(self.contentView,UI900(31))
    .widthIs(UI900(110))
    .heightIs(UI900(110));
    
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.numberOfLines = 0;
    [self.contentView addSubview:self.nameLabel];
    self.nameLabel.text = @"Branda";
    self.nameLabel.font = [UIFont systemFontOfSize:UI900(28)];
    self.nameLabel.textColor = Text333333Color;
    self.nameLabel.sd_layout
    .leftSpaceToView(self.headImgView,UI900(37))
    .topSpaceToView(self.contentView,UI900(50))
    .widthIs(0.4*UIScreenWidth)
    .autoHeightRatio(0);
    self.nameLabel.isAttributedContent = YES;

    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = @"  金牌讲师  ";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = RGB(54, 181, 253);
    self.titleLabel.font = [UIFont systemFontOfSize:UI900(20)];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.sd_layout
    .leftSpaceToView(self.nameLabel,UI900(11))
    .centerYEqualToView(self.nameLabel)
    .autoHeightRatio(0);
    self.titleLabel.sd_cornerRadiusFromHeightRatio = @(0.5);
    self.titleLabel.isAttributedContent = YES;
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.text = @"sadwqesqwdsadasczCsadwqesqwdsadasczCsadwqesqwdsadasczCsadwqesqwdsadasczC";
    self.detailLabel.textColor = Text666666Color;
    self.detailLabel.font = [UIFont systemFontOfSize:UI900(30)];
    [self.contentView addSubview:self.detailLabel];
    self.detailLabel.sd_layout
    .leftEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel,UI900(24))
    .rightSpaceToView(self.contentView,UI900(150))
    .autoHeightRatio(0);

    
    
    self.rightImgView = [[UIImageView alloc] init];
    self.rightImgView.image = [UIImage imageNamed:@"rightGo"];
    self.rightImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.rightImgView];
    self.rightImgView.sd_layout
    .rightSpaceToView(self.contentView,UI900(44))
    .widthIs(UI900(44))
    .heightIs(UI900(44))
    .centerYEqualToView(self.contentView);
    
    UIView* lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .topSpaceToView(self.detailLabel,UI900(29))
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(UI900(15));
    lineView.backgroundColor = UIColorFromRGB(0xf0f0f0);
    
    [self setupAutoHeightWithBottomView:lineView bottomMargin:0];
    [self sd_resetLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
