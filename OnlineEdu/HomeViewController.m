//
//  HomeViewController.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/3/23.
//  Copyright © 2017年 gaodehao. All rights reserved.
//

#import "HomeViewController.h"
#import "CourseDetailViewController.h"
@interface HomeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)UIScrollView* scrollView;
@property (strong,nonatomic)UIScrollView* rotateScrollView;
@property (strong,nonatomic)UIScrollView* courseTypeScrollView;
@property (strong,nonatomic)UIView* courseListView;
@property (strong,nonatomic)NSMutableArray* courseListArr;
@property (strong,nonatomic)UIImageView* tuijianImageView;
@property (strong,nonatomic)UILabel* tuijianLabel;
@property (strong,nonatomic)UIButton* changeBtn;
@property (strong,nonatomic)UIButton* moreBtn;
@property (nonatomic)NSTimer* rotateTimer;  //让视图自动切换

@property int rotatecount;
@property int courseTypeCount;
@property int courseListCount;
@property double rotateImgbianju;
@property double rotateImgW;
@property BOOL isNextOk;
@property BOOL isLastOk;
@property int shadowTag;
@end

@implementation HomeViewController
#pragma mark -----lifecycle-----
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setNavTitleWith:@"主页"];
    [self setBarBtnWithImage:[UIImage imageNamed:@"search"] SEL:@selector(search)];
    [self setScroll];
    [self setrotateScrollView];
    [self setCourseTypeScrollView];
    [self setCourseListScrollView];
    self.courseListArr = [NSMutableArray array];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -----others-----

#pragma mark -----onclick-----
-(void)search{
    NSLog(@"搜索");
}
//点击轮播图
-(void)rotateTouch:(UIButton*)sender{
    NSLog(@"%@",sender.titleLabel.text);
    NSLog(@"%li",sender.tag-_rotatecount-1000);
    
    CourseDetailViewController* cdVC = [[CourseDetailViewController alloc] init];
    cdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cdVC animated:YES];
}
//课程分类选择
-(void)choseCourseType:(UIButton*)sender{
    NSLog(@"%li",sender.tag-10000);
}
//换一换
-(void)changeCourseList{
    [self courseList];
    NSLog(@"换一换");
}
//更多课程
-(void)moreCourse{
    NSLog(@"更多课程");
}
//进入课程
-(void)courseIn:(UIButton*)sender{
    NSLog(@"进入课程%li",sender.tag-2000);
    CourseDetailViewController* cdVC = [[CourseDetailViewController alloc] init];
    cdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cdVC animated:YES];
}
#pragma mark -----getters-----
-(void)setScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth , UIScreenHeight-64-49)];
    self.scrollView.backgroundColor = RGB(241, 242, 245);
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.view addSubview: self.scrollView];
}
-(void)setrotateScrollView{
    _shadowTag = 0;
    _rotatecount = 4;
    _isNextOk = 1;
    _isLastOk = 1;
    _rotateImgbianju = 33/2.6;
    _rotateImgW = 1072*UIPlanScale1242;
    self.rotateScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth , UIPlanScale1242*409)];
    self.rotateScrollView.backgroundColor = [UIColor whiteColor];
    self.rotateScrollView.delegate = self;
    [self.scrollView addSubview: self.rotateScrollView];
    
    //设置滚动范围
    self.rotateScrollView.contentSize = CGSizeMake(UIScreenWidth*_rotatecount*3, self.rotateScrollView.frame.size.height);
    //设置分页效果
    self.rotateScrollView.pagingEnabled = YES;
    self.rotateScrollView.clipsToBounds = NO;
    self.rotateScrollView.frame = CGRectMake((UIScreenWidth-_rotateImgW)/2-_rotateImgbianju, 0, _rotateImgW+_rotateImgbianju, UIPlanScale1242*409);
    //水平滚动条隐藏
    self.rotateScrollView.showsHorizontalScrollIndicator = NO;
    //添加子视图  UILabel类型
    for (int i = 0; i< _rotatecount*3; i++) {
        UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake((_rotateImgW+_rotateImgbianju)*i+_rotateImgbianju, 0, _rotateImgW, self.rotateScrollView.frame.size.height)];
        subBtn.backgroundColor = [UIColor blueColor];
        subBtn.tag = 1000+i;
        [subBtn setTitle:[NSString stringWithFormat:@"第%d",i%_rotatecount+1] forState:UIControlStateNormal];
        [subBtn addTarget:self action:@selector(rotateTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        subBtn.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        subBtn.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        subBtn.layer.shadowOpacity = 0.8;//阴影透明度，默认0
        subBtn.layer.shadowRadius = 4;//阴影半径，默认3
        [self.rotateScrollView addSubview:subBtn];
    }
    [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_rotatecount, 0) animated:YES];
    
    self.rotateScrollView.tag = 1000;
    
    //启动定时器
    self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
}
//开始拖拽的代理方法，在此方法中暂停定时器。
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"正在拖拽视图，所以需要将自动播放暂停掉");
    //setFireDate：设置定时器在什么时间启动
    //[NSDate distantFuture]:将来的某一时刻
    [self.rotateTimer setFireDate:[NSDate distantFuture]];
}

//视图静止时（没有人在拖拽），开启定时器，让自动轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //视图静止之后，过1.5秒在开启定时器
    //[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]  返回值为从现在时刻开始 再过1.5秒的时刻。
//    NSLog(@"开启定时器");
    [self.rotateTimer setFireDate:[NSDate dateWithTimeInterval:3 sinceDate:[NSDate date]]];
    
        // 得到每页宽度
        CGFloat pageWidth = scrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
        if (currentPage == _rotatecount && _isLastOk == 1) {
            [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*(_rotatecount*2-1), 0) animated:NO];
            _isLastOk = 0;
        }else if (currentPage == _rotatecount*2+1 && _isNextOk == 1){
            [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_rotatecount, 0) animated:NO];
            _isNextOk = 0;
        }
        if (currentPage == _rotatecount*2+1 && _isNextOk == 0) {
            _isNextOk = 1;
        }
        if (currentPage == _rotatecount && _isLastOk == 0) {
            _isLastOk = 1;
        }
//        NSLog(@"%i",currentPage);
}

- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = self.rotateScrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.rotateScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    if (currentPage == _rotatecount && _isLastOk == 1) {
        self.rotateScrollView.userInteractionEnabled = NO;
    }else if (currentPage == _rotatecount*2+1 && _isNextOk == 1){
        self.rotateScrollView.userInteractionEnabled = NO;
    }else{
        self.rotateScrollView.userInteractionEnabled = YES;
    }
    
//    UIButton* buttonLast = [self.view viewWithTag:_shadowTag];
//    UIButton* buttonIndex = [self.view viewWithTag:1000+currentPage-1];
//    NSLog(@"--buttonIndex.tag----%li",buttonIndex.tag);
//    buttonIndex.layer.shadowOpacity = 0.8;
//    buttonLast.layer.shadowOpacity = 0;
//    _shadowTag = 1000+currentPage-1;
//    NSLog(@"------%i",currentPage);
}
//定时器的回调方法切换界面
- (void)changeView{
    
    // 得到每页宽度
    CGFloat pageWidth = self.rotateScrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.rotateScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    
    if (currentPage == _rotatecount*2+1 && _isNextOk == 1){
        [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_rotatecount, 0) animated:NO];
    }
    
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = self.rotateScrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += _rotateImgW+_rotateImgbianju;
    
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    [self.rotateScrollView setContentOffset:resultPoint animated:YES];
}
-(void)setCourseTypeScrollView{
    _courseTypeCount = 6;
    self.courseTypeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, UIPlanScale1242*409+10, UIScreenWidth , UIPlanScale1242*250)];
//    self.courseTypeScrollView.backgroundColor = [UIColor redColor];
    self.courseTypeScrollView.delegate = self;
    [self.scrollView addSubview: self.courseTypeScrollView];
    //设置滚动范围
    int width =(int)ceilf(_courseTypeCount/4.0);
    self.courseTypeScrollView.contentSize = CGSizeMake(UIScreenWidth*width, self.courseTypeScrollView.frame.size.height);
    //设置分页效果
    self.courseTypeScrollView.pagingEnabled = YES;
    //水平滚动条隐藏
    self.courseTypeScrollView.showsHorizontalScrollIndicator = NO;
    
    float btnX = (UIScreenWidth - _rotateImgW)/2;
    float btnJianju = (_rotateImgW-4*121*UIPlanScale1242)/3+121*UIPlanScale1242;
    for (int i = 0,j = 0; i<_courseTypeCount; i++,j++) {
        int indexPage =(int)floorf(i/4.0);
        NSLog(@"=========%d",indexPage);
        if (i%4==0) j=0;
        UIButton* btn =[[UIButton alloc] initWithFrame:CGRectMake(btnX+(j*btnJianju)+indexPage*UIScreenWidth, 35*UIPlanScale1242, 121*UIPlanScale1242, 121*UIPlanScale1242)];
        [btn setImage:[UIImage imageNamed:@"reviewTouch"] forState:UIControlStateNormal];
        CGRect rect = btn.frame;
        rect.origin.y = btn.frame.origin.y+btn.frame.size.height+5;
        UILabel* label = [[UILabel alloc] initWithFrame:rect];
        label.text = [NSString stringWithFormat:@"PHP开发第%i",i];
        label.textAlignment = 1;
        label.font = [UIFont systemFontOfSize:40*UIPlanScale1242];
        label.textColor = RGB(38, 38, 38);
//        label.numberOfLines = 0;
        [label sizeToFit];
        CGPoint point = label.center;
        point.x = btn.center.x;
        label.center = point;
        [self.courseTypeScrollView addSubview:btn];
        [self.courseTypeScrollView addSubview:label];
        
        CGRect btnRect = btn.frame;
        btnRect.size.width = label.frame.size.width>btn.frame.size.width?label.frame.size.width:btn.frame.size.width;
        btnRect.size.height += label.frame.size.height;
        UIButton* touchBtn = [[UIButton alloc] initWithFrame:btnRect];
        touchBtn.alpha = 0.5;
        CGPoint touchBtnP = touchBtn.center;
        touchBtnP.x = btn.center.x > label.center.x?btn.center.x : label.center.x;
        touchBtn.center = touchBtnP;
        [self.courseTypeScrollView addSubview:touchBtn];
        touchBtn.tag = 10000+i;
        [touchBtn addTarget:self action:@selector(choseCourseType:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)setCourseListScrollView{
    _courseListCount = 10;
    CGRect rect = self.courseTypeScrollView.frame;
    rect.size.height = 600;
    rect.origin.y += self.courseTypeScrollView.frame.size.height;
    self.courseListView = [[UIView alloc] initWithFrame:rect];
    self.courseListView.backgroundColor = RGB(241, 242, 245);
    [self.scrollView addSubview:self.courseListView];
    
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(62*UIPlanScale1242, 45*UIPlanScale1242, 45*UIPlanScale1242, 45*UIPlanScale1242)];
    imgView.image = [UIImage imageNamed:@"home1"];
    [self.courseListView addSubview:imgView];
    
    CGRect rectTuijian = imgView.frame;
    rectTuijian.origin.x += rectTuijian.size.width+13*UIPlanScale1242;
    rectTuijian.size.width = 100;
    UILabel* tuijian = [[UILabel alloc] initWithFrame:rectTuijian];
    tuijian.font = [UIFont systemFontOfSize:40*UIPlanScale1242];
    tuijian.text = @"课程推荐";
    tuijian.textColor = RGB(82, 82, 82);
    [self.courseListView addSubview:tuijian];
    
    CGRect recthuanyihuan = imgView.frame;
    recthuanyihuan.size.width = 40;
    recthuanyihuan.size.height = 40;
    recthuanyihuan.origin.x = UIScreenWidth - 40-56*UIPlanScale1242;
    self.changeBtn = [[UIButton alloc] initWithFrame:recthuanyihuan];
    CGPoint p = self.changeBtn.center;
    p.y = imgView.center.y;
    self.changeBtn.center = p;
    [self.changeBtn setTitle:@"换一换" forState:UIControlStateNormal];
    [self.changeBtn setTitleColor:RGB(82, 82, 82) forState:UIControlStateNormal];
    self.changeBtn.titleLabel.font = [UIFont systemFontOfSize:40*UIPlanScale1242];
    [self.changeBtn addTarget:self action:@selector(changeCourseList) forControlEvents:UIControlEventTouchUpInside];
    [self.courseListView addSubview:self.changeBtn];
    [self courseList];
    

}
-(void)courseList{
    float y = self.changeBtn.frame.origin.y+self.changeBtn.frame.size.height;
    double bottom = 0.0;
    if (self.courseListArr.count>0) {
        for (int i = 0; i<self.courseListArr.count; i++) {
            [self.courseListArr[i] removeFromSuperview];
        }
    }
    for (int i = 0; i<_courseListCount; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(54*UIPlanScale1242+i%2*((546+42)*UIPlanScale1242), y+(i/2)*((410+34)*UIPlanScale1242), (UIScreenWidth-2*54*UIPlanScale1242-42*UIPlanScale1242)/2, 410*UIPlanScale1242)];
        view.backgroundColor = [UIColor whiteColor];
        
        CGRect imageViewFrame = view.frame;
        imageViewFrame.origin.x = 0;
        imageViewFrame.origin.y = 0;
        imageViewFrame.size.height = imageViewFrame.size.height*280/410;
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        imageView.image = [UIImage imageNamed:@"level1"];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [view addSubview:imageView];
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(26*UIPlanScale1242, imageViewFrame.size.height+23*UIPlanScale1242, imageView.frame.size.width-26*UIPlanScale1242, 42*UIPlanScale1242)];
        uint rand = random()%100;
        title.text = [NSString stringWithFormat:@"高中物理——精品课程%d",rand];
        title.font = [UIFont systemFontOfSize:33*UIPlanScale1242];
        title.textColor = RGB(38, 38, 38);
        [view addSubview:title];
        
        UILabel* personCount = [[UILabel alloc] initWithFrame:CGRectMake(26*UIPlanScale1242, imageViewFrame.size.height+23*UIPlanScale1242+52*UIPlanScale1242, imageView.frame.size.width-26*UIPlanScale1242, 42*UIPlanScale1242)];
        personCount.text = [NSString stringWithFormat:@"%i人学习",1000+i];
        personCount.font = [UIFont systemFontOfSize:30*UIPlanScale1242];
        personCount.textColor = RGB(166, 166, 166);
        [view addSubview:personCount];
        
        CGRect courseInBtnFrame = view.frame;
        courseInBtnFrame.origin.x = 0;
        courseInBtnFrame.origin.y = 0;
        UIButton* courseInBtn = [[UIButton alloc] initWithFrame:courseInBtnFrame];
        [courseInBtn addTarget:self action:@selector(courseIn:) forControlEvents:UIControlEventTouchUpInside];
        courseInBtn.tag = 2000+i;
        [view addSubview:courseInBtn];
        [self.courseListView addSubview:view];
          bottom = view.frame.origin.y+view.frame.size.height + self.courseTypeScrollView.frame.size.height+self.courseTypeScrollView.frame.origin.y;
        [self.courseListArr addObject:view];
    }
    if (!self.moreBtn) {
        CGRect rect = self.changeBtn.frame;
        rect.size.width *=2;
        self.moreBtn = [[UIButton alloc] initWithFrame:rect];
        [self.moreBtn setTitle:@"更多课程" forState:UIControlStateNormal];
        [self.moreBtn setTitleColor:RGB(82, 82, 82) forState:UIControlStateNormal];
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:40*UIPlanScale1242];
        [self.moreBtn addTarget:self action:@selector(moreCourse) forControlEvents:UIControlEventTouchUpInside];
        CGPoint p = self.moreBtn.center;
        p.y = bottom-self.courseTypeScrollView.frame.size.height-self.courseTypeScrollView.frame.origin.y+20;
        p.x -= rect.size.width/2;
        self.moreBtn.center = p;
        [self.courseListView addSubview:self.moreBtn];
        CGRect courseListViewFrame = self.courseListView.frame;
        courseListViewFrame.size.height = bottom+40+10-self.courseTypeScrollView.frame.size.height-self.courseTypeScrollView.frame.origin.y;
        self.courseListView.frame = courseListViewFrame;
        self.scrollView.contentSize = CGSizeMake(UIScreenWidth, bottom+40+10);
    }
    
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
