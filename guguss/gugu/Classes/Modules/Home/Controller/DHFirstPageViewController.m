//
//  DHFirstPageViewController.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/6.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHFirstPageViewController.h"

#import "DHHomeCommon.h"
#import "DHHome_CellModel.h"
#import "DHHome_SectionModel.h"
#import "DHCommonCollectionViewCell.h"
#import "DHCycleScrollCollectionViewCell.h"
#import "DHCommonCollectionViewCell.h"
@interface DHFirstPageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSString *type;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)UICollectionView *myCollectionView;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,strong)NSMutableArray<DHHome_SectionModel*>*dataArray;
@end

@implementation DHFirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)initialize{
    
 
}

-(void)dh_viewDidLoadForIndex:(NSInteger)index
{
    self.index = index;
    [self initialize];
    [self initializeParamWithIndex:index];
    [self initializeComponent];
}

//根据下标初始化参数
-(void)initializeParamWithIndex:(NSInteger)index{
    
    switch (index) {
        case 0:
            self.type = @"0";
            break;
        case 1:
            self.type = @"1";
            break;
        case 2:
            self.type = @"2";
            break;
        default:
            break;
    }
}
//初始化组件
-(void)initializeComponent{
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    if (self.index < 3) {
        _myCollectionView.frame = self.view.frame;
        _myCollectionView.backgroundColor = [UIColor whiteColor];
    }else{
        _myCollectionView.frame = CGRectMake(0, 35, SCREENWIDTH, self.view.frame.size.height-35);
        _myCollectionView.backgroundColor = RGB(242, 242, 242);
    }
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.showsVerticalScrollIndicator = NO;
    _myCollectionView.showsHorizontalScrollIndicator = NO;
    [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
    [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerID"];
    [self.view addSubview:_myCollectionView];
    self.currentPage = 1;
    [self checkNetWorking];
    [self setRefresh];
}
//检查网络
-(void)checkNetWorking
{
    [self requestListData];
}
//请求数据
-(void)requestListData{

    switch (self.index) {
        case 0:
            [self bindFirstPageData:nil];
            break;
        case 1:
            [self bindFirstPageData:nil];
            break;
        case 2:
            [self bindFirstPageData:nil];
            break;
        default:
            break;
    }
}
//绑定当前页数据
-(void)bindFirstPageData:(NSDictionary *)data{

//    if (!data) {
//        return;
//    }
    _dataArray = [[NSMutableArray alloc]init];
    if (self.myCollectionView.mj_header.isRefreshing) {
        [self.myCollectionView.mj_header endRefreshing];
    }
    NSArray *bannerArray = [data objectForKey:@""];
//    if (bannerArray.count != 0) {
    DHHome_CellModel *cycModel = [self creatCellModel:[DHCycleScrollCollectionViewCell class] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:bannerArray,@"data",@"1",@"type", nil] size:[DHCycleScrollCollectionViewCell calculateSize:bannerArray]];
    DHHome_SectionModel *section0 = [self createSectionModel:@[cycModel] headerHeight:0 footerHeight:0];
    [self.dataArray addObject:section0];
    
    DHHome_CellModel *comModel2 = [self creatCellModel:[DHCommonCollectionViewCell class] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:bannerArray,@"data",@"2",@"type", nil] size:[DHCommonCollectionViewCell calculateSize:bannerArray]];
    DHHome_CellModel *comModel3 = [self creatCellModel:[DHCommonCollectionViewCell class] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:bannerArray,@"data",@"3",@"type", nil] size:[DHCommonCollectionViewCell calculateSize:bannerArray]];
    DHHome_CellModel *comModel4 = [self creatCellModel:[DHCommonCollectionViewCell class] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:bannerArray,@"data",@"4",@"type", nil] size:[DHCommonCollectionViewCell calculateSize:bannerArray]];
     DHHome_CellModel *comModel5 = [self creatCellModel:[DHCommonCollectionViewCell class] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:bannerArray,@"data",@"5",@"type", nil] size:[DHCommonCollectionViewCell calculateSize:bannerArray]];
    
    DHHome_SectionModel *section1 = [self createSectionModel:@[comModel2,comModel3,comModel4,comModel5] headerHeight:0 footerHeight:0];
    [self.dataArray addObject:section1];
        
//    }
    for (DHHome_SectionModel *sectionModel in _dataArray) {
        for (DHHome_CellModel *cellModel in sectionModel.cells) {
            [_myCollectionView registerClass:NSClassFromString(cellModel.className) forCellWithReuseIdentifier:cellModel.reuseIdentifier];
        }
    }
    if (_dataArray.count!=0) {
        [_myCollectionView reloadData];
    }
}
//设置刷新
-(void)setRefresh
{
    
    
    
}
-(DHHome_CellModel *)creatCellModel:(Class)cls userInfo:(id)userInfo size:(CGSize)size{
    DHHome_CellModel *model = [[DHHome_CellModel alloc]init];
    model.selectorString = UITableViewCellSelectionStyleNone;
    model.userInfo = userInfo;
    model.size = size;
    model.className = NSStringFromClass(cls);
    return model;
}
-(DHHome_SectionModel *)createSectionModel:(NSArray<DHHome_CellModel*>*)items headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight
{
    DHHome_SectionModel *model = [DHHome_SectionModel sectionModelWithTitle:nil cells:items];
    model.headerhHeight = headerHeight;
    model.footerHeight = footerHeight;
    return model;
}

#pragma --mark DHScrollPageViewChildVcDelegate
- (void)dh_viewWillAppearForIndex:(NSInteger)index
{
    
}
- (void)dh_viewDidAppearForIndex:(NSInteger)index
{
    
}
- (void)dh_viewWillDisappearForIndex:(NSInteger)index
{
    
}
- (void)dh_viewDidDisappearForIndex:(NSInteger)index
{
    
}

#pragma --mark UICollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (_dataArray) {
        return _dataArray.count;
    }
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    DHHome_SectionModel *s = _dataArray[section];
    if (s.cells) {
        return s.cells.count;
    }
    
    return 0;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataArray.count != 0) {
        DHHome_SectionModel *s = _dataArray[indexPath.section];
        DHHome_CellModel *item = s.cells[indexPath.row];
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:item.reuseIdentifier forIndexPath:indexPath];
        SEL selector = NSSelectorFromString(@"fillData:");
        if([cell respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
            [cell performSelector:selector withObject:nil];
#pragma clang diagnostic pop
        }
            return cell;
    }
    
    return nil;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DHHome_SectionModel *s = _dataArray[indexPath.section];
    DHHome_CellModel *item = s.cells[indexPath.row];
    return item.size;
    
}


@end
