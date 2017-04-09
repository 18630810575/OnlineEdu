//
//  CourseTextImageTableViewCell.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/4/6.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "CourseTextImageTableViewCell.h"

@implementation CourseTextImageTableViewCell

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
    self.infoLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.infoLabel];
    self.infoLabel.font = [UIFont systemFontOfSize:UI701(22)];
    NSArray* array = [NSArray arrayWithObjects:
                      @"2132423435432545646983456534635465436543653465346",
                      @"都会接撒谎的金卡是好的爱上的还是啥都会撒娇肯定回家撒看会电视剧按客户的骄傲圣诞节卡上的空间撒谎的金卡是好的空间啥都会接撒谎的金卡是好的爱上的还是啥都会撒娇肯定回家撒看会电视剧按客户的骄傲圣诞节卡上的空间撒谎的金卡是好的空间",
                      @"卡上的空间撒谎的金卡是好的空间啥都会接撒谎的金卡是好的爱上的还是啥都会撒娇",nil];
    uint count = random()%3;
//    self.infoLabel.backgroundColor = [UIColor redColor];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:array[0] attributes:@{NSForegroundColorAttributeName : Text666666Color, NSParagraphStyleAttributeName: paragraphStyle}];
    self.infoLabel.attributedText = attrString;
    
    self.imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgView];
    self.imgView.image = [UIImage imageNamed:@"level2"];
    self.imgView.contentMode = UIViewContentModeScaleToFill;
    
    
    self.infoLabel.sd_layout
    .topSpaceToView(self.contentView,UI701(27))
    .leftSpaceToView(self.contentView,UI701(53))
    .rightSpaceToView(self.contentView,UI701(60))
    .autoHeightRatio(0);
    self.infoLabel.isAttributedContent = YES;
    
    self.imgView.sd_layout
    .topSpaceToView(self.infoLabel,UI701(20))
    .leftSpaceToView(self.contentView,UI701(23))
    .rightSpaceToView(self.contentView,UI701(23))
    .autoHeightRatio(0.445);
    
    [self setupAutoHeightWithBottomView:self.imgView bottomMargin:0];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
