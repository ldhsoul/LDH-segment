//
//  DHViewController.m
//  MY
//
//  Created by fubang on 2017/7/19.
//  Copyright © 2017年 fubang. All rights reserved.
//

#import "DHViewController.h"
#import <Masonry.h>
#import "DHModel.h"
#import "DHMyCommon.h"
#import "DHUserInfoITTACell.h"
#import "DHSectionModel.h"
#import "LoadingView.h"


@interface DHViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) NSArray<DHSectionModel *> *sectionArray;

@end

@implementation DHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"my";
    [self initializeComponent];
    _sectionArray = [self createDatas];
    
    [self setWithBlock:^(id obj) {
        
        NSLog(@"%@",obj);
    }];
}


-(void)setWithBlock:(BKLoginSuccessBlock)block
{

    block(@"1");

}


#pragma mark ===========================视图布局============================================
-(void)initializeComponent {
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _mainTableView.dataSource = self;
    _mainTableView.delegate= self;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.tableFooterView = [[UIView alloc]init];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
  
    [self.view addSubview:_mainTableView];
    
    [self layoutViews];
    
}

-(void)layoutViews{
    
//    [self.cusNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view.mas_left);
//        make.right.mas_equalTo(self.view.mas_right);
//        make.top.mas_equalTo(self.view.mas_top);
//        make.height.mas_equalTo(64);
//    }];
//    
//    [self.settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self.view.mas_right).offset(-ApplicationNavigationBarBackGauge-8);
//        make.top.mas_equalTo(self.view.mas_top).offset(28);
//        make.height.mas_equalTo(26);
//        make.width.mas_equalTo(26);
//    }];
//    
//    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(self.settingBtn.mas_left).offset(-10);
//        make.top.mas_equalTo(self.settingBtn.mas_top);
//        make.height.mas_equalTo(26);
//        make.width.mas_equalTo(26);
//        
//    }];
//    
//    [self.bageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerY.mas_equalTo(self.messageBtn.mas_top).offset(6);
//        make.centerX.mas_equalTo(self.messageBtn.mas_right).offset(-3);
//        make.size.mas_equalTo(CGSizeMake(6, 6));
//    }];
//    
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        
    }];
    
    
}
-(NSArray<DHSectionModel*>*)createDatas{
    
    DHModel *realName = [DHModel cellModelWithTitle:MyLocalizedString(@"DHUserMyRealName") subTitle:@"" image:@"icon_normal_shimingrenzheng" sel:@"goToRealName"];
    realName.height = 45;
    realName.style = UITableViewCellStyleValue1;
    realName.className = NSStringFromClass([DHUserInfoITTACell class]);
    realName.isShowBottomLine = YES;
    realName.reuseIdentifier = DHUserInfoITTACellIdentify;
    
    DHSectionModel *section0 = [DHSectionModel sectionModelWithTitle:nil andCell:@[realName]];
    section0.headerhHeight = 10;
    section0.footerHeight = 0.1;
    
    DHModel *account = [DHModel cellModelWithTitle:MyLocalizedString(@"DHUserMyAccount") subTitle:@"" image:@"icon_normal_shimingrenzheng" sel:@"goToAccount"];
    account.height = 45;
    account.style = UITableViewCellStyleValue1;
    account.className = NSStringFromClass([DHUserInfoITTACell class]);
    account.isShowBottomLine = YES;
    account.reuseIdentifier = DHUserInfoITTACellIdentify;
    
    DHSectionModel *section1 = [DHSectionModel sectionModelWithTitle:nil andCell:@[account]];
    section0.headerhHeight = 10;
    section0.footerHeight = 0.1;
    
    DHModel *realName2 = [DHModel cellModelWithTitle:MyLocalizedString(@"DHUserMyRealName2") subTitle:@"" image:@"icon_normal_shimingrenzheng" sel:@"goToRealName2"];
    realName2.height = 45;
    realName2.style = UITableViewCellStyleValue1;
    realName2.className = NSStringFromClass([DHUserInfoITTACell class]);
    realName2.isShowBottomLine = YES;
    realName2.reuseIdentifier = DHUserInfoITTACellIdentify;
    
    DHModel *account2 = [DHModel cellModelWithTitle:MyLocalizedString(@"DHUserMyAccount2") subTitle:@"" image:@"icon_normal_shimingrenzheng" sel:@"goToAccount2"];
    account2.height = 45;
    account2.style = UITableViewCellStyleValue1;
    account2.className = NSStringFromClass([DHUserInfoITTACell class]);
    account2.isShowBottomLine = YES;
    account2.reuseIdentifier = DHUserInfoITTACellIdentify;
    
    DHSectionModel *section2 = [DHSectionModel sectionModelWithTitle:nil andCell:@[realName2,account2]];
    section0.headerhHeight = 10;
    section0.footerHeight = 0.1;
    
    
    return @[section0,section1,section2];

}


#pragma mark ===========================tableViewDelegate============================================

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return _sectionArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DHSectionModel *sec = _sectionArray[section];

    return sec.cell.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    DHSectionModel *sec = _sectionArray[indexPath.section];
    DHModel *cellModel = sec.cell[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.reuseIdentifier];
    
    if (cell == nil) {
        
        cell = [[NSClassFromString(cellModel.className) alloc]initWithStyle:cellModel.style reuseIdentifier:cellModel.reuseIdentifier];
    }
    cell.selected = NO;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
 
    DHSectionModel *sec = _sectionArray[indexPath.section];
    DHModel *cellModel = sec.cell[indexPath.row];
    
    if ([cell respondsToSelector:@selector(fillData:)]) {
        
        [cell performSelector:@selector(fillData:) withObject:cellModel];
    }
    


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DHSectionModel *sec = _sectionArray[indexPath.section];
    DHModel *cellModel = sec.cell[indexPath.row];
    
    NSString * selString = cellModel.selectorString;
    
    if (selString) {
        
        SEL selec = NSSelectorFromString(selString);
        
        if ([self respondsToSelector:selec]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
            [self performSelector:selec withObject:nil];
        }
        
    }

}



-(void)goToRealName
{

    NSLog(@"gotorealname");

}




@end
