//
//  UserCircleTableViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/7.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "UserCircleTableViewCell.h"

@implementation UserCircleTableViewCell

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
    self.leftLabel.text =@"消息通知";
    self.leftLabel.textColor = Text333333Color;
    self.leftLabel.font = [UIFont systemFontOfSize:UI1242(44)];
    
    self.rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.rightLabel];
    self.rightLabel.text = @" 3 ";
    self.rightLabel.textColor = [UIColor whiteColor];
    self.rightLabel.font = [UIFont systemFontOfSize:UI1242(28)];
    self.rightLabel.backgroundColor = UIColorFromRGB(0xff5f60);
    self.rightLabel.textAlignment = 2;
    
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
    .autoHeightRatio(0)
    .heightEqualToWidth()
    .centerYEqualToView(self.contentView);
    self.rightLabel.sd_cornerRadiusFromHeightRatio = @(1);
    
    self.rightImgView.sd_layout
    .rightSpaceToView(self.contentView,UI1242(44))
    .widthIs(UI1242(44))
    .heightIs(UI1242(44))
    .centerYEqualToView(self.contentView);
    
    UIView* lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.blueLabel,UI1242(46))
    .heightIs(UI1242(27));
    lineView.backgroundColor = UIColorFromRGB(0xf3f6f6);
    
    [self setupAutoHeightWithBottomView:lineView bottomMargin:0];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
