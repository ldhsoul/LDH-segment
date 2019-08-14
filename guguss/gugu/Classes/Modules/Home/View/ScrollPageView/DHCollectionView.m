//
//  DHCollectionView.m
//  SegmentAndPage
//
//  Created by fubang on 2017/11/9.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHCollectionView.h"
#import "DHCommon.h"
#import "UIViewController+DHScrollPageController.h"

#define cellID @"cellID"

@interface DHCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    BOOL _isLoadFirstView;
    NSInteger _sysVersion;
    BOOL isFirstLoaded;
    CGFloat  _oldOffSetX;
    
}
@property(nonatomic,assign)NSInteger itemsCount;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,strong)UICollectionViewCell *cell;
//当前控制器
@property (strong, nonatomic) UIViewController<DHScrollPageViewChildVcDelegate> *currentChildVc;
// 所有的子控制器
@property (strong, nonatomic) NSMutableDictionary<NSString *, UIViewController<DHScrollPageViewChildVcDelegate> *> *childVcsDic;
// 父类 用于处理添加子控制器  使用weak避免循环引用
@property (weak, nonatomic) UIViewController<DHScrollPageDelegate> *parentViewController;
// 当这个属性设置为YES的时候 就不用处理 scrollView滚动的计算
@property (assign, nonatomic) BOOL forbidTouchToAdjustPosition;
@property (strong,nonatomic)id<DHScrollPageDelegate> spdelegate;
@property (assign, nonatomic) NSInteger oldIndex;
@property (assign, nonatomic) BOOL needManageLifeCycle;
@property (assign, nonatomic) BOOL changeAnimated;
@end

@implementation DHCollectionView



-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
   if (self = [super initWithCoder:aDecoder]) {
       
       
       [self commonInit];
       
    }
    
    return self;
    
}

-(void)commonInit{
    
    _sysVersion = [[[UIDevice currentDevice] systemVersion] integerValue];
     _currentIndex = 0;
}


/** 给外界可以设置ContentOffSet的方法 */
- (void)setContentOffSet:(CGPoint)offset animated:(BOOL)animated {
    self.forbidTouchToAdjustPosition = YES;
    
    NSInteger currentIndex = offset.x/self.bounds.size.width;
    _oldIndex = _currentIndex;
    self.currentIndex = currentIndex;
    _changeAnimated = YES;
    
    if (animated) {
        CGFloat delta = offset.x - self.contentOffset.x;
        NSInteger page = fabs(delta)/self.bounds.size.width;
        if (page>=2) {// 需要滚动两页以上的时候, 跳过中间页的动画
            _changeAnimated = NO;
            __weak typeof(self) weakself = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof(weakself) strongSelf = weakself;
                if (strongSelf) {
                    [strongSelf setContentOffset:offset animated:NO];
                }
            });
        }
        else {
            [self setContentOffset:offset animated:animated];
        }
    }
    else {
        [self setContentOffset:offset animated:animated];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.forbidTouchToAdjustPosition || // 点击标题滚动
        scrollView.contentOffset.x <= 0 || // first or last
        scrollView.contentOffset.x >= scrollView.contentSize.width - scrollView.bounds.size.width) {
        return;
    }
    CGFloat tempProgress = scrollView.contentOffset.x / self.bounds.size.width;
    NSInteger tempIndex = tempProgress;
    
    CGFloat progress = tempProgress - floor(tempProgress);
    CGFloat deltaX = scrollView.contentOffset.x - _oldOffSetX;
    
    if (deltaX > 0) {// 向右
        if (progress == 0.0) {
            return;
        }
        self.currentIndex = tempIndex+1;
        self.oldIndex = tempIndex;
    }
    else if (deltaX < 0) {
        progress = 1.0 - progress;
        self.oldIndex = tempIndex+1;
        self.currentIndex = tempIndex;
    }
    else {
        return;
    }
    [self contentViewDidMoveFromIndex:_oldIndex toIndex:_currentIndex progress:progress];
}

/** 滚动减速完成时再更新title的位置 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = (scrollView.contentOffset.x / self.bounds.size.width);
    [self contentViewDidMoveFromIndex:currentIndex toIndex:currentIndex progress:1.0];
    
    // 调整title
    [self adjustSegmentTitleOffsetToCurrentIndex:currentIndex];
}

- (void)contentViewDidMoveFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress
{
    if ([_spdelegate respondsToSelector:@selector(adjustUIWithProgress:oldIndex:currentIndex:)]) {
        [_spdelegate adjustUIWithProgress:progress oldIndex:fromIndex currentIndex:toIndex];
    }
}

- (void)adjustSegmentTitleOffsetToCurrentIndex:(NSInteger)index {
    if ([_spdelegate respondsToSelector:@selector(adjustTitleOffSetToCurrentIndex:)]) {
        [_spdelegate adjustTitleOffSetToCurrentIndex:index];
    }
}

-(void)setSdelegate:(UIViewController<DHScrollPageDelegate>*)VC
{
    if ([VC respondsToSelector:@selector(numberOfViewController)]) {
        self.itemsCount = [VC numberOfViewController];
    }
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    self.delegate = self;
    self.dataSource = self;
    self.pagingEnabled = YES;
    self.spdelegate = VC;
    self.parentViewController = VC;
    
}

-(void)setupChildVcForCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString *keyStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    _currentChildVc = [_childVcsDic valueForKey:keyStr];
       BOOL isFirstLoaded = _currentChildVc == nil;
    if (_spdelegate && [_spdelegate respondsToSelector:@selector(childViewController:forIndex:)]) {
        if (!_currentChildVc) {
             _currentChildVc = [_spdelegate childViewController:nil forIndex:indexPath];
            if (!_currentChildVc || ![_currentChildVc conformsToProtocol:@protocol(DHScrollPageViewChildVcDelegate)]) {
                NSAssert(NO, @"子控制器必须遵守DHScrollPageViewChildVcDelegate协议");
            }
            // 设置当前下标
            _currentChildVc.dh_currentIndex = indexPath.row;
            [self.childVcsDic setValue:_currentChildVc forKey:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
            
        }else{
             [_spdelegate childViewController:_currentChildVc forIndex:indexPath];
            
        }
        
    }else {
        NSAssert(NO, @"必须设置代理和实现代理方法");
    }
    // 这里建立子控制器和父控制器的关系
    if ([_currentChildVc isKindOfClass:[UINavigationController class]]) {
        NSAssert(NO, @"不要添加UINavigationController包装后的子控制器");
    }
    if (_currentChildVc.dh_scrollViewController != self.parentViewController) {
        [self.parentViewController addChildViewController:_currentChildVc];
    }
    _currentChildVc.view.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _currentChildVc.view.backgroundColor = RANDOMCOLOR;
     [cell.contentView addSubview:_currentChildVc.view];
    [_currentChildVc didMoveToParentViewController:self.parentViewController];
    
    [self willAppearWithIndex:_currentIndex];
    if (isFirstLoaded) {
        // viewDidLoad
        if ([_currentChildVc respondsToSelector:@selector(dh_viewDidLoadForIndex:)]) {
            [_currentChildVc dh_viewDidLoadForIndex:indexPath.row];
        }
    }
    [self didAppearWithIndex:_currentIndex];
}

-(void)willAppearWithIndex:(NSInteger )index
{
    
    
}
-(void)didAppearWithIndex:(NSInteger )index
{
    
    
}

- (void)willDisappearWithIndex:(NSInteger)index
{
    
}

- (void)didDisappearWithIndex:(NSInteger)index
{
    
}

- (NSMutableDictionary<NSString *,UIViewController<DHScrollPageViewChildVcDelegate> *> *)childVcsDic {
    if (!_childVcsDic) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        _childVcsDic = dic;
    }
    return _childVcsDic;
}

#pragma --mark CollectionViewDelegate代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _itemsCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    // 移除subviews 避免重用内容显示错误
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_sysVersion >= 8) {
        [self setupChildVcForCell:cell atIndexPath:indexPath];
    }
    
}



@end
