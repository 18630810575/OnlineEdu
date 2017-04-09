//
//  UserNormalTableViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/7.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "UserNormalTableViewCell.h"

@implementation UserNormalTableViewCell

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
    self.blueLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.blueLabel];
    self.blueLabel.backgroundColor = UIColorFromRGB(0x41c3fe);
    
    self.leftLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.leftLabel];
    self.leftLabel.text =@"我的在线预约";
    self.leftLabel.textColor = Text333333Color;
    self.leftLabel.font = [UIFont systemFontOfSize:UI1242(44)];
    
    self.rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.rightLabel];
    self.rightLabel.text = @"3";
    self.rightLabel.textColor = Text666666Color;
    self.rightLabel.font = [UIFont systemFontOfSize:UI1242(28)];
    
    self.rightImgView = [[UIImageView alloc] init];
    self.rightImgView.image = [UIImage imageNamed:@"rightGo"];
    self.rightImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.rightImgView];
    
    self.blueLabel.sd_layout
    .leftSpaceToView(self.contentView,UI1242(50))
    .heightIs(UI1242(55))
    .widthIs(UI1242(11))
    .centerYEqualToView(self.contentView);
    
    self.leftLabel.sd_layout
    .leftSpaceToView(self.blueLabel,UI1242(30))
    .autoHeightRatio(0)
    .centerYEqualToView(self.contentView);
    
    self.rightLabel.sd_layout
    .rightSpaceToView(self.contentView,UI1242(111))
    .centerYEqualToView(self.contentView);
    
    self.rightImgView.sd_layout
    .rightSpaceToView(self.contentView,UI1242(44))
    .widthIs(UI1242(44))
    .heightIs(UI1242(44))
    .centerYEqualToView(self.contentView);
    
    [self setupAutoHeightWithBottomView:self.blueLabel bottomMargin:UI1242(46)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
