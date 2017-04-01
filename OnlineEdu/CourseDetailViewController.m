//
//  CourseDetailViewController.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/3/31.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "TeacherCell.h"
@interface CourseDetailViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)UIScrollView* scrollView;
@property (strong,nonatomic)UIScrollView* threeScrollView;
@property (strong,nonatomic)UIImageView* topImgView;
@property (strong,nonatomic)UIButton* courseDetailBtn;
@property (strong,nonatomic)UIButton* studentReviewBtn;
@property (strong,nonatomic)UIButton* aboutcourseBtn;
@property (strong,nonatomic)UIScrollView* courseDetailScrollView;
@property (strong,nonatomic)UIScrollView* studentReviewScrollView;
@property (strong,nonatomic)UIScrollView* aboutcourseScrollView;
@property (strong,nonatomic)UIView* lineBlue;
@property (strong,nonatomic)UILabel* widthLabel;
@property (strong,nonatomic)UILabel* priceLabel;
@property (strong,nonatomic)UIButton* buyBtn;
@property int indexPage;
@end

@implementation CourseDetailViewController

#pragma mark -----lifecycle-----
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _indexPage = 1;
    [self setNavTitleWith:@"客服系统班"];
    [self setBarBtnWithImage:[UIImage imageNamed:@"share"] SEL:@selector(share)];
    [self setTopImgView];
    [self setTabBar];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: YES];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -----others-----
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.threeScrollView) {
        // 得到每页宽x度
        CGFloat pageWidth = self.threeScrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
        NSLog(@"%d",currentPage);
        UIButton* btn = [[UIButton alloc] init];
        btn.tag = 100+currentPage;
        [self topThree:btn];
        btn=nil;
    }
}
- (void)changeView{
    // 得到每页宽度
    CGFloat pageWidth = self.threeScrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.threeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    int pageOffset = _indexPage-currentPage;
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = self.threeScrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += pageOffset*UIScreenWidth;
    
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    [self.threeScrollView setContentOffset:resultPoint animated:YES];
}

#pragma mark -----onclick-----
-(void)share{
    NSLog(@"分享");
}
-(void)topThree:(UIButton*)sender{
    if (sender.tag == 101) {
        _indexPage = 1;
        [self.courseDetailBtn setTitleColor:blueText forState:UIControlStateNormal];
        [self.studentReviewBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        [self.aboutcourseBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        
        self.widthLabel = self.courseDetailBtn.titleLabel;
        CGPoint p = self.courseDetailBtn.center;
        p.y = self.lineBlue.center.y;
        [self.widthLabel sizeToFit];
        float width = self.widthLabel.frame.size.width;
        CGRect rect = self.lineBlue.frame;
        rect.size.width = width;
        self.lineBlue.frame = rect;
        self.lineBlue.center = p;
        
    }else if (sender.tag == 102){
        _indexPage = 2;
        [self.courseDetailBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        [self.studentReviewBtn setTitleColor:blueText forState:UIControlStateNormal];
        [self.aboutcourseBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        
        self.widthLabel = self.studentReviewBtn.titleLabel;
        CGPoint p = self.studentReviewBtn.center;
        p.y = self.lineBlue.center.y;
        [self.widthLabel sizeToFit];
        float width = self.widthLabel.frame.size.width;
        CGRect rect = self.lineBlue.frame;
        rect.size.width = width;
        self.lineBlue.frame = rect;
        self.lineBlue.center = p;
    }else{
        _indexPage = 3;
        [self.courseDetailBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        [self.studentReviewBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
        [self.aboutcourseBtn setTitleColor:blueText forState:UIControlStateNormal];
        
        self.widthLabel = self.aboutcourseBtn.titleLabel;
        CGPoint p = self.aboutcourseBtn.center;
        p.y = self.lineBlue.center.y;
        [self.widthLabel sizeToFit];
        float width = self.widthLabel.frame.size.width;
        CGRect rect = self.lineBlue.frame;
        rect.size.width = width;
        self.lineBlue.frame = rect;
        self.lineBlue.center = p;
    }
    [self changeView];
}
-(void)buy{
    NSLog(@"购买");
}
#pragma mark -----getters-----
-(void)setTabBar{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, UIScreenHeight-49-64, UIScreenWidth, 49)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(55*UIPlanScale900, 0, UIScreenWidth/2, 49)];
    self.priceLabel.textColor = UIColorFromRGB(0xfb3355);
    self.priceLabel.font = [UIFont systemFontOfSize:40*UIPlanScale900 weight:3];
    self.priceLabel.text = @"￥ 300 元";
    [view addSubview:self.priceLabel];
    
    self.buyBtn = [[UIButton alloc] initWithFrame:CGRectMake(UIScreenWidth-237*UIPlanScale900, 0, 237*UIPlanScale900, 49)];
    self.buyBtn.titleLabel.textColor = [UIColor whiteColor];
    self.buyBtn.backgroundColor = UIColorFromRGB(0xfb3355);
    self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:40*UIPlanScale900];
    [self.buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [self.buyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.buyBtn];
}
-(void)setTopImgView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight-64)];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(40*UIPlanScale900, 0, UIScreenWidth-2*40*UIPlanScale900, 395*UIPlanScale900)];
    self.topImgView.image = [UIImage imageNamed:@"level2"];
    [self setShadow:self.topImgView Opacity:0.8 Radius:4 Color:[UIColor blackColor]];
    [self.scrollView addSubview:self.topImgView];
    [self setTopThreeBtn];
    self.topImgView.backgroundColor = [UIColor redColor];
}
-(void)setTopThreeBtn{
    float y = self.topImgView.frame.origin.y+self.topImgView.frame.size.height+15;
    self.courseDetailBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, y, UIScreenWidth/3, 108*UIPlanScale900)];
    [self.courseDetailBtn setTitle:@"课程介绍" forState:UIControlStateNormal];
    [self.courseDetailBtn setTitleColor:blueText forState:UIControlStateNormal];
    self.courseDetailBtn.titleLabel.font = [UIFont systemFontOfSize:30*UIPlanScale900];
    [self.courseDetailBtn addTarget:self action:@selector(topThree:) forControlEvents:UIControlEventTouchUpInside];
    self.courseDetailBtn.tag = 101;
    [self.scrollView addSubview:self.courseDetailBtn];
    
    self.studentReviewBtn = [[UIButton alloc] initWithFrame:CGRectMake(UIScreenWidth/3, y, UIScreenWidth/3, 108*UIPlanScale900)];
    [self.studentReviewBtn setTitle:[NSString stringWithFormat:@"学生评论(223)"] forState:UIControlStateNormal];
    [self.studentReviewBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
    self.studentReviewBtn.titleLabel.font = [UIFont systemFontOfSize:30*UIPlanScale900];
    [self.studentReviewBtn addTarget:self action:@selector(topThree:) forControlEvents:UIControlEventTouchUpInside];
    self.studentReviewBtn.tag = 102;
    [self.scrollView addSubview:self.studentReviewBtn];
    
    self.aboutcourseBtn = [[UIButton alloc] initWithFrame:CGRectMake(UIScreenWidth/3*2, y, UIScreenWidth/3, 108*UIPlanScale900)];
    [self.aboutcourseBtn setTitle:[NSString stringWithFormat:@"相关课程"] forState:UIControlStateNormal];
    [self.aboutcourseBtn setTitleColor:Text666666Color forState:UIControlStateNormal];
    self.aboutcourseBtn.titleLabel.font = [UIFont systemFontOfSize:30*UIPlanScale900];
    [self.aboutcourseBtn addTarget:self action:@selector(topThree:) forControlEvents:UIControlEventTouchUpInside];
    self.aboutcourseBtn.tag = 103;
    [self.scrollView addSubview:self.aboutcourseBtn];
    
    y = self.aboutcourseBtn.frame.origin.y+self.aboutcourseBtn.frame.size.height+2;
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, y, UIScreenWidth, 1)];
    line.backgroundColor = linedcdcdcColor;
    [self.scrollView addSubview:line];
    
    self.widthLabel = self.courseDetailBtn.titleLabel;
    CGPoint p = self.courseDetailBtn.center;
    p.y = y;
    [self.widthLabel sizeToFit];
    float width = self.widthLabel.frame.size.width;
    self.lineBlue = [[UIView alloc] initWithFrame:CGRectMake(0, y, width, 2)];
    self.lineBlue.center = p;
    self.lineBlue.backgroundColor = UIColorFromRGB(0x49c2ff);
    [self.scrollView addSubview:self.lineBlue];
    
    y+=1;
    
    self.threeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, UIScreenWidth, UIScreenHeight-49-64)];
    self.threeScrollView.delegate = self;
    [self.scrollView addSubview:self.threeScrollView];
    
    //设置滚动范围
    self.threeScrollView.contentSize = CGSizeMake(UIScreenWidth*3, self.threeScrollView.frame.size.height);
    //设置分页效果
    self.threeScrollView.pagingEnabled = YES;
    //水平滚动条隐藏
    self.threeScrollView.showsHorizontalScrollIndicator = NO;
    self.threeScrollView.showsVerticalScrollIndicator = NO;
    
    
    CGRect rect = self.threeScrollView.frame;
    rect.origin.y = 0;
    self.courseDetailScrollView = [[UIScrollView alloc]initWithFrame:rect];
    [self.threeScrollView addSubview:self.courseDetailScrollView];
    
    rect.origin.x += UIScreenWidth;
    self.studentReviewScrollView = [[UIScrollView alloc]initWithFrame:rect];
    self.studentReviewScrollView.backgroundColor = [UIColor yellowColor];
    [self.threeScrollView addSubview:self.studentReviewScrollView];
    
    rect.origin.x += UIScreenWidth;
    self.aboutcourseScrollView = [[UIScrollView alloc]initWithFrame:rect];
    self.aboutcourseScrollView.backgroundColor = [UIColor greenColor];
    [self.threeScrollView addSubview:self.aboutcourseScrollView];
    
    [self setCourseData];
    [self setStudentReviewData];
    [self setAboutCourseData];
    
}
-(void)setCourseData{
    NSMutableArray* imgNameArr = [NSMutableArray array];
    [imgNameArr addObject:@"courseType"];
    [imgNameArr addObject:@"studyTime"];
    [imgNameArr addObject:@"study"];
    [imgNameArr addObject:@"favour"];
    UILabel* courseNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(33*UIPlanScale900, 40*UIPlanScale900, 0.6*UIScreenWidth, 41*UIPlanScale900)];
    courseNameLabel.preferredMaxLayoutWidth = 0.6*UIScreenWidth;
    courseNameLabel.text = @"客服系统运维系统班";
    courseNameLabel.textColor = Text333333Color;
    courseNameLabel.font = [UIFont systemFontOfSize:41*UIPlanScale900];
    [self.courseDetailScrollView addSubview:courseNameLabel];
    
    float width = UIScreenWidth-0.6*UIScreenWidth-(33+33)*UIPlanScale900;
    UILabel* timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(UIScreenWidth-width-33*UIPlanScale900, 40*UIPlanScale900, width, 41*UIPlanScale900)];
    timeLabel.preferredMaxLayoutWidth = 0.6*UIScreenWidth;
    timeLabel.text = @"2017-12-12 12:12";
    timeLabel.textColor = Text666666Color;
    timeLabel.textAlignment = 2;
    timeLabel.font = [UIFont systemFontOfSize:30*UIPlanScale900];
    [self.courseDetailScrollView addSubview:timeLabel];
    
    float y = timeLabel.frame.origin.y+timeLabel.frame.size.height;
    float y1 =0.0;
    for (int i = 0; i<4; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake((i%4)*(UIScreenWidth/4), y, UIScreenWidth/4, 108*UIPlanScale900)];
        [self.courseDetailScrollView addSubview:view];
        CGRect rect = view.frame;
        rect.origin.x = 0;
        rect.origin.y = 0;
        UIButton* button = [[UIButton alloc] initWithFrame:rect];
        [button setImage:[UIImage imageNamed:imgNameArr[i]] forState:UIControlStateNormal];
        [button setTitle:@" 123" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:30*UIPlanScale900];
        [button setTitleColor:UIColorFromRGB(0xb7b7b7) forState:UIControlStateNormal];
        button.adjustsImageWhenHighlighted = NO;
        [view addSubview:button];
        y1 = view.frame.size.height+view.frame.origin.y;
    }
    UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y1, UIScreenWidth, 15*UIPlanScale900)];
    lineView.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.courseDetailScrollView addSubview:lineView];
    
    y = lastBottomY(lineView);
    
    TeacherCell*teacherCell = [[TeacherCell alloc] init];
    CGRect rect = teacherCell.frame;
    rect.origin.y = CGRectGetMaxY(lineView.frame);
    teacherCell.frame = rect;
    [self.courseDetailScrollView addSubview:teacherCell];
    
}
-(void)setStudentReviewData{
    
}
-(void)setAboutCourseData{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
