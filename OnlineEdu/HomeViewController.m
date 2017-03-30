//
//  HomeViewController.m
//  OnlineEdu
//
//  Created by 高德昊 on 2017/3/23.
//  Copyright © 2017年 gaodehao. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)UIScrollView* scrollView;
@property (strong,nonatomic)UIScrollView* rotateScrollView;
@property (nonatomic)NSTimer* rotateTimer;  //让视图自动切换

@property int count;
@property double rotateImgbianju;
@property double rotateImgW;
@property BOOL isNextOk;
@property BOOL isLastOk;
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
-(void)rotateTouch:(UIButton*)sender{
    NSLog(@"%@",sender.titleLabel.text);
    NSLog(@"%li",sender.tag);
}

#pragma mark -----getters-----
-(void)setScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth , UIScreenHeight-64-49)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    [self.view addSubview: self.scrollView];
}
-(void)setrotateScrollView{
    _count = 10;
    _isNextOk = 1;
    _isLastOk = 1;
    _rotateImgbianju = 33/2.6;
    _rotateImgW = 1072*UIPlanScale;
    self.rotateScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth , UIPlanScale*409)];
    self.rotateScrollView.backgroundColor = [UIColor whiteColor];
    self.rotateScrollView.delegate = self;
    [self.scrollView addSubview: self.rotateScrollView];
    
    //设置滚动范围
    self.rotateScrollView.contentSize = CGSizeMake(UIScreenWidth*_count*3, self.rotateScrollView.frame.size.height);
    //设置分页效果
    self.rotateScrollView.pagingEnabled = YES;
    self.rotateScrollView.clipsToBounds = NO;
    self.rotateScrollView.frame = CGRectMake((UIScreenWidth-_rotateImgW)/2-_rotateImgbianju, 0, _rotateImgW+_rotateImgbianju, UIPlanScale*409);
    //水平滚动条隐藏
    self.rotateScrollView.showsHorizontalScrollIndicator = NO;
    //添加子视图  UILabel类型
    for (int i = 0; i< _count*3; i++) {
        UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake((_rotateImgW+_rotateImgbianju)*i+_rotateImgbianju, 0, _rotateImgW, self.rotateScrollView.frame.size.height)];
        subBtn.backgroundColor = [UIColor blueColor];
        subBtn.tag = 1001+i%_count;
        [subBtn setTitle:[NSString stringWithFormat:@"我是第%d个视图",i%_count+1] forState:UIControlStateNormal];
        [subBtn addTarget:self action:@selector(rotateTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.rotateScrollView addSubview:subBtn];
    }
    [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_count, 0) animated:YES];
    
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
        if (currentPage == _count && _isLastOk == 1) {
            [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*(_count*2-1), 0) animated:NO];
            _isLastOk = 0;
        }else if (currentPage == _count*2+1 && _isNextOk == 1){
            [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_count, 0) animated:NO];
            _isNextOk = 0;
        }
        if (currentPage == _count*2+1 && _isNextOk == 0) {
            _isNextOk = 1;
        }
        if (currentPage == _count && _isLastOk == 0) {
            _isLastOk = 1;
        }
        
            NSLog(@"%i",currentPage);
    
    
}

- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = self.rotateScrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.rotateScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    if (currentPage == _count && _isLastOk == 1) {
        self.rotateScrollView.userInteractionEnabled = NO;
    }else if (currentPage == _count*2+1 && _isNextOk == 1){
        self.rotateScrollView.userInteractionEnabled = NO;
    }else{
        self.rotateScrollView.userInteractionEnabled = YES;
    }
    
//    NSLog(@"------%i",currentPage);
}
//定时器的回调方法   切换界面
- (void)changeView{
    
    // 得到每页宽度
    CGFloat pageWidth = self.rotateScrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.rotateScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    
    if (currentPage == _count*2+1 && _isNextOk == 1){
        [self.rotateScrollView setContentOffset:CGPointMake((_rotateImgW+_rotateImgbianju)*_count, 0) animated:NO];
    }
    
    //通过改变contentOffset来切换滚动视图的子界面
    float offset_X = self.rotateScrollView.contentOffset.x;
    //每次切换一个屏幕
    offset_X += _rotateImgW+_rotateImgbianju;
    
    CGPoint resultPoint = CGPointMake(offset_X, 0);
    [self.rotateScrollView setContentOffset:resultPoint animated:YES];
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
