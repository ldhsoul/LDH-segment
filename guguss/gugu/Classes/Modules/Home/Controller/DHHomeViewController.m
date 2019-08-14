//
//  DHHomeViewController.m
//  SegmentAndPage
//
//  Created by fubang on 2017/8/22.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHHomeViewController.h"
//#import <SDCycleScrollView.h>
#import "DHScrollPageDelegate.h"
#import "DHCollectionView.h"
#import "DHFirstPageViewController.h"
#import "DHPublicCommon.h"
#import "UIView+EXTENSION.h"
#import "DHSemgentView.h"
#import "DHSegmentStyle.h"
#import "DHCommon.h"
#import "DHTitleView.h"

@interface DHHomeViewController ()<DHScrollPageDelegate>

//@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSArray *imageArray;
@property (weak, nonatomic) IBOutlet DHCollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *myCollectionFlowLayout;
@property (weak, nonatomic) IBOutlet UIView *mySegmentBg;
@property (strong, nonatomic) DHSemgentView *segment;
@property (strong, nonatomic) NSArray *titlesArray;
@property(nonatomic,strong)NSArray *pictures;
@property(nonatomic,strong)NSArray *select_pictures;

@end



@implementation DHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
 
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)initialize{
    _myCollectionView.sdelegate = self;
    _myCollectionFlowLayout.itemSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT - self.navigationController.navigationBar.size.height-self.tabBarController.tabBar.height - 24-76);
    _myCollectionFlowLayout.minimumLineSpacing = 0.0;
    _myCollectionFlowLayout.minimumInteritemSpacing = 0.0;
    _myCollectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [self requestTitleData];
    
}

#pragma mark ------------------请求标题数组-----------------------------
-(void)requestTitleData
{
    self.titlesArray = @[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9",@"标题10",@"标题11",@"标题12",@"标题13"];
    [self addView_ScrollHeaderView];
}

#pragma mark -------------------添加头部可滚动标题视图------------------------
-(void)addView_ScrollHeaderView{
    //必要的设置, 如果没有设置可能导致内容显示不正常
//   self.automaticallyAdjustsScrollViewInsets = NO;
    self.myCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    DHSegmentStyle *style = [[DHSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    //设置滚动条颜色
    style.scrollLineColor = RGB(3, 181, 152);
    //标题选中的颜色
    style.selectedTitleColor = RGB(3, 181, 152);
    style.normalTitleColor = RGB(136, 136, 136);
    style.adjustTitleWhenBeginDrag = NO;
    style.scaleTitle = NO;
    style.autoAdjustTitlesWidth = YES;
    style.segmentHeight = 60;
    //    style.contentViewBounces = NO;
    //标题之间的间隙
    style.titleMargin = 20;
    style.scrollLineHeight = 2;
    style.titleFont = [UIFont systemFontOfSize:12];
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    // 初始化
    style.imagePosition = TitleImagePositionTop;
    [style setShowImage:YES];
    
    __weak typeof(self) weakSelf = self;
    _segment = [[DHSemgentView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, style.segmentHeight) segmentStyle:style delegate:self.myCollectionView.sdelegate titles:self.titlesArray pictures:self.pictures select_pictures:self.select_pictures titleDidClick:^(DHTitleView *titleView, NSInteger index) {
        [weakSelf.myCollectionView setContentOffSet:CGPointMake(weakSelf.myCollectionView.bounds.size.width * index, 0.0) animated:style.isAnimatedContentViewWhenTitleClicked];
        
    }];
    
    [self.mySegmentBg addSubview:_segment];
}

#pragma mark----------------------各代理相关-----------------------------
-(NSInteger)numberOfViewController
{
    return 13;
}

-(void)adjustUIWithProgress:(CGFloat)progress oldIndex:(NSInteger)oldIndex currentIndex:(NSInteger)currentIndex
{
    [_segment adjustUIWithProgress:progress oldIndex:oldIndex currentIndex:currentIndex];
}

- (void)adjustTitleOffSetToCurrentIndex:(NSInteger)currentIndex
{
    [_segment adjustTitleOffSetToCurrentIndex:currentIndex];
}

-(UIViewController<DHScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<DHScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSIndexPath *)indexPath
{
    UIViewController<DHScrollPageViewChildVcDelegate> *childVC = reuseViewController;
    if (!childVC) {
        childVC = [[DHFirstPageViewController alloc] init];
    }
    
    return childVC;
}

@end
