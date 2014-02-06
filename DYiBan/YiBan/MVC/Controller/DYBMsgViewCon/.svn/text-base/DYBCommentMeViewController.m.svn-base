//
//  DYBCommentMeViewController.m
//  DYiBan
//
//  Created by zhangchao on 13-8-9.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBCommentMeViewController.h"
#import "UITableView+property.h"
#import "UITableView+property.h"
#import "mc.h"
#import "DYBCellForCommentMe.h"
#import "UIView+DragonCategory.h"
#import "DYBDynamicDetailViewController.h"
#import "status.h"
#import "UIViewController+DragonCategory.h"

@interface DYBCommentMeViewController ()
{
    DragonUIImageView *imgV;
    DragonUILabel *lb;
}
@end

@implementation DYBCommentMeViewController

-(void)creatTbv{
    if (!_tbv) {
        _tbv = [[DragonUITableView alloc] initWithFrame:CGRectMake(0, self.headHeight+1, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-self.headHeight) isNeedUpdate:YES];
        //        _tbv._cellH=92;
        [self.view addSubview:_tbv];
        _tbv.backgroundColor=/*[UIColor colorWithRed:248 green:248 blue:255 alpha:1]*/ [UIColor whiteColor];//248 248 255
        _tbv.tag=-1;
        _tbv._page=1;
        _tbv.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_tbv setTableViewType:DTableViewSlime];
        RELEASE(_tbv);
        
    }
    
}

#pragma mark- ViewController信号
- (void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal
{
    [super handleViewSignal:signal];
    
    if ([signal is:DragonViewController.CREATE_VIEWS]) {
        [self observeNotification:[UIViewController AutoRefreshTbvInViewWillAppear]];
        
        {//HTTP请求
            [self.view setUserInteractionEnabled:NO];
            DragonRequest *request = [DYBHttpMethod review_list:(_tbv._page=1) pageNum:10 :0 isAlert:YES receive:self];
            [request setTag:1];
            
            if (!request) {//无网路
//                [_tbv.footerView changeState:VIEWTYPEFOOTER];
            }
        }
        
        
    }else if ([signal is:DragonViewController.WILL_APPEAR]){
        [self.headview setTitle:@"评论我的"];
        [self backImgType:0];
        self.rightButton.hidden=YES;
        
        if (self.b_isAutoRefreshTbvInViewWillAppear) {
            {//HTTP请求
                [self.view setUserInteractionEnabled:NO];
                DragonRequest *request = [DYBHttpMethod review_list:(_tbv._page=1) pageNum:10 :0 isAlert:YES receive:self];
                [request setTag:1];
                
                if (!request) {//无网路
                    //                [_tbv.footerView changeState:VIEWTYPEFOOTER];
                }
            }
            
            self.b_isAutoRefreshTbvInViewWillAppear=NO;
        }
        
    }else if ([signal is:DragonViewController.DID_DISAPPEAR]){
        //        RELEASEVIEW(_tbv);//界面不显示时彻底释放TBV,已释放cell
        
    }else if ([signal is:[DragonViewController LAYOUT_VIEWS]])
    {
        
    }else if ([signal is:[DragonViewController FREE_DATAS]])//dealloc时回调,先释放数据
    {
        [_tbv releaseDataResource];
        
    }else if ([signal is:[DragonViewController DELETE_VIEWS]]){//dealloc时回调,再释放视图
        
        [_tbv release_muA_differHeightCellView];
        
        REMOVEFROMSUPERVIEW(_tbv);//界面不显示时彻底释放TBV,已释放cell
        
    }
    
}

#pragma mark- 初始化无数据提示view
-(void)initNoDataView:(NSString *)str{
    if (imgV) {
        REMOVEFROMSUPERVIEW(imgV);
        REMOVEFROMSUPERVIEW(lb);
    }
    
    if ([str isEqualToString:@""]) {
        return;
    }
    
    UIImage *img=[UIImage imageNamed:@"ybx_big"];
    imgV=[[DragonUIImageView alloc]initWithFrame:CGRectMake(0, 0, img.size.width/2, img.size.height/2) backgroundColor:[UIColor clearColor] image:img isAdjustSizeByImgSize:NO userInteractionEnabled:YES masksToBounds:NO cornerRadius:-1 borderWidth:-1 borderColor:nil superView:self.view Alignment:2 contentMode:UIViewContentModeScaleAspectFit stretchableImageWithLeftCapWidth:-1 topCapHeight:-1];
    
    RELEASE(imgV);
    
    {
        lb=[[DragonUILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgV.frame)+20, 0, 0)];
        lb.backgroundColor=[UIColor clearColor];
        lb.textAlignment=NSTextAlignmentLeft;
        lb.font=[DYBShareinstaceDelegate DYBFoutStyle:20];
        lb.text=str;
        lb.textColor=ColorGray;
        lb.numberOfLines=2;
        lb.lineBreakMode=NSLineBreakByWordWrapping;
        [lb sizeToFitByconstrainedSize:CGSizeMake(240, 1000)];
        [self.view addSubview:lb];
        [lb changePosInSuperViewWithAlignment:0];
        
        lb.linesSpacing=20;
        [lb setNeedCoretext:YES];
        RELEASE(lb);
    }
    
}

#pragma mark- 接受tbv信号

static NSString *cellName = @"cellName";//前4个cell

- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal
{
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])//numberOfRowsInSection
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        NSInteger section = [[dict objectForKey:@"section"] integerValue];
        
        if ([tableView isOneSection]) {/*一个section模式*/
            NSNumber *s = [NSNumber numberWithInteger:tableView.muA_singelSectionData.count];
            [signal setReturnValue:s];
        }else if(tableView.muA_allSectionKeys.count>section){
            NSString *key = [tableView.muA_allSectionKeys objectAtIndex:section];
            NSArray *array = [tableView.muD_allSectionValues objectForKey:key];
            NSNumber *s = [NSNumber numberWithInteger:array.count];
            [signal setReturnValue:s];
        }
        
    }else if ([signal is:[DragonUITableView TABLENUMOFSEC]])//numberOfSectionsInTableView
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        
        if ([tableView isOneSection]) {/*一个section模式*/
            NSNumber *s = [NSNumber numberWithInteger:1];
            [signal setReturnValue:s];
        }else{
            NSNumber *s = [NSNumber numberWithInteger:tableView.muA_allSectionKeys.count];
            [signal setReturnValue:s];
        }
        
    }
    else if ([signal is:[DragonUITableView TABLEHEIGHTFORROW]])//heightForRowAtIndexPath  暂时把每个cell保存,后期有时间优化为只保存高度,返回cell时再异步计算cell的视图,目前刷新后所有cell的view都要重新创建
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        
        NSMutableArray *arr_curSectionForCell=nil;
        NSMutableArray *arr_curSectionForModel=nil;
        
        if (![tableView isOneSection]) {//
            //多section时 _muA_differHeightCellView变成2维数组,第一维是 有几个section,第二维是每个section里有几个cell
            if (!tableView._muA_differHeightCellView) {
                tableView._muA_differHeightCellView=[[NSMutableArray alloc]initWithCapacity:[tableView.muD_allSectionValues allKeys].count];
            }
            
            if (tableView._muA_differHeightCellView.count==0) {
                for (int i=0; i<[tableView.muD_allSectionValues allKeys].count; i++) {
                    [tableView._muA_differHeightCellView addObject:[[NSMutableArray alloc]initWithCapacity:3]];
                }
            }
            
            //保存cell的当前section对应的array
            arr_curSectionForCell=(((NSMutableArray *)([tableView._muA_differHeightCellView objectAtIndex:indexPath.section])));
            
            //保存数据模型的当前section对应的array
            arr_curSectionForModel=[tableView.muD_allSectionValues objectForKey:[tableView.muA_allSectionKeys objectAtIndex:indexPath.section]];
        }
        
        if(indexPath.row==((([tableView isOneSection])?(tableView._muA_differHeightCellView):(arr_curSectionForCell)).count/*只创建没计算过的cell*/) || !tableView._muA_differHeightCellView || ((([tableView isOneSection])?(tableView._muA_differHeightCellView):(arr_curSectionForCell)).count/*只创建没计算过的cell*/)==0)
        {
            
            DYBCellForCommentMe *cell = [[[DYBCellForCommentMe alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName] autorelease];
            [cell setContent:[(([tableView isOneSection])?(tableView.muA_singelSectionData):(arr_curSectionForModel)) objectAtIndex:indexPath.row] indexPath:indexPath tbv:tableView];
            
            if (!tableView._muA_differHeightCellView) {
                tableView._muA_differHeightCellView=[[NSMutableArray alloc]initWithCapacity:[tableView.muD_allSectionValues allKeys].count];
            }
            
            if (![(([tableView isOneSection])?(tableView._muA_differHeightCellView):(arr_curSectionForCell)) containsObject:cell]) {
                [(([tableView isOneSection])?(tableView._muA_differHeightCellView):(arr_curSectionForCell)) addObject:cell];
            }
            
            NSNumber *s = [NSNumber numberWithInteger:cell.frame.size.height];
            [signal setReturnValue:s];
            
        }else{//之前计算过的cell
            NSNumber *s = [NSNumber numberWithInteger:((DYBCellForCommentMe *)[(([tableView isOneSection])?(tableView._muA_differHeightCellView):(arr_curSectionForCell)) objectAtIndex:indexPath.row]).frame.size.height];
            [signal setReturnValue:s];
        }
        
    }
    else if ([signal is:[DragonUITableView TABLETITLEFORHEADERINSECTION]])//titleForHeaderInSection
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        NSInteger section = [[dict objectForKey:@"section"] integerValue];
        
        if ([tableView isOneSection]) {/*一个section模式*/
            
        }else{
            [signal setReturnValue:[tableView.muA_allSectionKeys objectAtIndex:section]];
        }
        
    }
    else if ([signal is:[DragonUITableView TABLEVIEWFORHEADERINSECTION]])//viewForHeaderInSection
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        
        if ([tableView isOneSection]) {/*一个section模式*/
        }else{
            [self createSectionHeaderView:signal];
        }
        
    }//
    else if ([signal is:[DragonUITableView TABLETHEIGHTFORHEADERINSECTION]])//heightForHeaderInSection
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        
        [signal setReturnValue:[NSNumber numberWithFloat:((tableView.muA_allSectionKeys.count==0/*一个section模式*/)?(0):(27))]];
        
    }
    else if ([signal is:[DragonUITableView TABLECELLFORROW]])//cell  只返回显示的cell
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
        if ([tableView isOneSection]) {/*一个section模式*/
            cell=((UITableViewCell *)[tableView._muA_differHeightCellView objectAtIndex:indexPath.row]);
        }else{
            //保存cell的当前section对应的array
            NSMutableArray *arr_curSectionForCell=(((NSMutableArray *)([tableView._muA_differHeightCellView objectAtIndex:indexPath.section])));
            cell=((UITableViewCell *)[arr_curSectionForCell objectAtIndex:indexPath.row]);
        }
        
        [signal setReturnValue:cell];
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableview = [dict objectForKey:@"tableView"];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        mc *model=[_tbv.muA_singelSectionData objectAtIndex:indexPath.row];
        model.view=1;
        
        NSDictionary *d=[NSDictionary dictionaryWithObjectsAndKeys:model.status_id,@"id",model.status_type,@"status_type", nil];
        status *model2 = [status JSONReflection:d];
        [model2 retain];
        
        [_tbv release_muA_differHeightCellView];
        [_tbv reloadData];
        
        DYBDynamicDetailViewController *vc = [[DYBDynamicDetailViewController alloc] init:model2 withStatus:1 bScroll:NO];
        [self.drNavigationController pushViewController:vc animated:YES];
        RELEASE(vc);
        
    }
    else if ([signal is:[DragonUITableView TAbLEVIEWLODATA]])//加载更多
    {
        DragonUITableView *tableView = (DragonUITableView *)[signal source];
        {//HTTP请求
            [self.view setUserInteractionEnabled:NO];
            DragonRequest *request = [DYBHttpMethod review_list:(++tableView._page) pageNum:10 :[((mc *)(tableView.muA_singelSectionData.lastObject)).id intValue] isAlert:YES receive:self];
            [request setTag:2];
            
            if (!request) {//无网路
                [_tbv reloadData:NO];
            }
        }
    }
    else if ([signal is:[DragonUITableView TABLEVIEWUPDATA]])//刷新
    {
        
        DragonUITableView *tableView = (DragonUITableView *)[signal source];
        
        {//HTTP请求
            [self.view setUserInteractionEnabled:NO];
            DragonRequest *request = [DYBHttpMethod review_list:(tableView._page=1) pageNum:10 :0 isAlert:YES receive:self];
            [request setTag:1];
            
            if (!request) {//无网路
                [_tbv reloadData:NO];
            }
        }
    }

    else if ([signal is:[DragonUITableView TABLESECTIONINDEXTITLESFORTABLEVIEW]])//右侧索引列表
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableView = [dict objectForKey:@"tableView"];
        
        if (![tableView isOneSection]) {/*多个section模式*/
            [signal setReturnValue:tableView.muA_allSectionKeys];
        }
    }else if ([signal is:[DragonUITableView TABLESECTIONFORSECTIONINDEXTITLE]])//点击右测是索引列表上的某个字母时回调,参数index和title是 右侧索引列表上被点击的字母在 索引列表的下标和名字,返回被点击的字母对应的section的下标
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        UITableView *tableview = [dict objectForKey:@"tableView"];
        NSString *title = [dict objectForKey:@"title"];
        NSInteger index = [[dict objectForKey:@"index"] integerValue];
        
        //在数据源的下标
        NSInteger count = 0;
        
        for(NSString *character in tableview.muA_allSectionKeys)
        {
            if([character isEqualToString:title])
            {
                [signal setReturnValue:[NSNumber numberWithInteger:count]];
                break;
            }
            count ++;
        }
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLUP]]){//上滑
        
        [_tbv StretchingUpOrDown:0];
        
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLDOWN]]){//下滑
        
        [_tbv StretchingUpOrDown:1];
        
    }

}
    
    
#pragma mark- 接受按钮信号
- (void)handleViewSignal_DragonUIButton:(DragonViewSignal *)signal{
    if ([signal is:[DragonUIButton TOUCH_UP_INSIDE]]) {
        DragonUIButton *bt=(DragonUIButton *)signal.source;
        if (bt)
        {
            switch (bt.tag) {
                case -1://删除cell
                {
                    NSString *ID=(NSString *)signal.object;
                    
                    //                    chat *model=[_tbv.muA_singelSectionData objectAtIndex:index.row];
                    
                    {//HTTP请求
                        [self.view setUserInteractionEnabled:NO];
                        DragonRequest *request = [DYBHttpMethod messageDelComment:ID isAlert:YES receive:self];
                        [request setTag:3];
                        
                        if (!request) {//无网路
//                            [_tbv.footerView changeState:VIEWTYPEFOOTER];
                        }
                    }
                    
                }
                    break;
                default:
                    break;
            }
        }
        
    }
    
}

#pragma mark- 通知中心回调
- (void)handleNotification:(NSNotification *)notification
{
  if ([notification is:[UIViewController AutoRefreshTbvInViewWillAppear]]){
        self.b_isAutoRefreshTbvInViewWillAppear=YES;
    }
}

#pragma mark- 只接受HTTP信号
- (void)handleRequest:(DragonRequest *)request receiveObj:(id)receiveObj
{
    if ([request succeed])
    {
        switch (request.tag) {
            case 1://获取|刷新
            {
                JsonResponse *response = (JsonResponse *)receiveObj;
                if ([response response] ==khttpsucceedCode)
                {
                    NSArray *list=[response.data objectForKey:@"mc"];
                    
                    if (_tbv.muA_singelSectionData.count>0 && list.count>0) {
                        [_tbv.muA_singelSectionData removeAllObjects];
                        
                        [_tbv release_muA_differHeightCellView];
                    }
                    
                    for (NSDictionary *d in list) {
                        mc *model = [mc JSONReflection:d];
                        if (!_tbv.muA_singelSectionData) {
                            [self creatTbv];

                            _tbv.muA_singelSectionData=[NSMutableArray arrayWithObject:model];
                            [_tbv.muA_singelSectionData retain];
                        }else{
                            [_tbv.muA_singelSectionData addObject:model];
                        }
                    }
                    
                    {
                        if (_tbv.muA_singelSectionData.count>0 && list.count>0) {
                            [_tbv._muA_differHeightCellView removeAllObjects];
                            
                            [self initNoDataView:@""];

                            if ([[response.data objectForKey:@"havenext"] isEqualToString:@"1"]) {
                                [_tbv reloadData:NO];
                            }else{
                                [_tbv reloadData:YES];
                            }
                            
                        [self.view setUserInteractionEnabled:YES];

                        return;
                        
                        }else{//没获取到数据,恢复headerView
//                            [_tbv reloadData:YES];
                        }
                        
                    }
                    
                }else if ([response response] ==khttpfailCode){
                    
                }
                
                [self initNoDataView:@"没有评论"];
                [_tbv releaseDataResource];
                [_tbv release_muA_differHeightCellView];
                [_tbv reloadData:YES];
                
                [self.view setUserInteractionEnabled:YES];
                
            }
                
                break;
                
            case 2://加载更多
            {
                JsonResponse *response = (JsonResponse *)receiveObj;
                
                if ([response response] ==khttpsucceedCode)
                {
                    NSArray *list=[response.data objectForKey:@"mc"];
                    for (NSDictionary *d in list) {
                        mc *model = [mc JSONReflection:d];
                        if (!_tbv.muA_singelSectionData) {
                            _tbv.muA_singelSectionData=[NSMutableArray arrayWithObject:model];
                            [_tbv.muA_singelSectionData retain];
                        }else{
                            [_tbv.muA_singelSectionData addObject:model];
                        }
                    }
                    
//                    if (list.count>0) {
//                        [_tbv reloadData:NO];
//                    }else{
//                        [_tbv.footerView changeState:PULLSTATEEND];
//                    }
                    
                    {//加载更多
                        if (_tbv.muA_singelSectionData.count>0 && list.count>0) {
                            
                            if ([[response.data objectForKey:@"havenext"] isEqualToString:@"1"]) {
                                [_tbv reloadData:NO];
                            }else{
                                [_tbv reloadData:YES];
                            }
                        }else{//没获取到数据,恢复headerView
                            [_tbv reloadData:YES];
                        }
                        
                    }
                    
                    [self.view setUserInteractionEnabled:YES];
                    return;
                    
                }else if ([response response] ==khttpfailCode)
                {
                    
                }
                
                [self.view setUserInteractionEnabled:YES];
//                [_tbv.footerView changeState:PULLSTATEEND];
                
                
            }
                break;
                
            case 3://删除
            {
                JsonResponse *response = (JsonResponse *)receiveObj;
                
                if ([response response] ==khttpsucceedCode)
                {
                    NSString *del=[response.data objectForKey:@"del"];
                    
                    if ([del isEqualToString:@"1"]) {
                        NSIndexPath *index=_tbv._selectIndex_now;
                        
                        [_tbv.muA_singelSectionData removeObjectAtIndex:index.row];
                        [_tbv._muA_differHeightCellView removeObjectAtIndex:index.row];
                        
                        //                        [_tbv beginUpdates];
                        [_tbv deleteRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationFade];
                        //                        [_tbv endUpdates];
                        
                        [_tbv release_muA_differHeightCellView];
                        [_tbv reloadData:YES];
                        
//                        [_tbv._selectIndex_now release];
                        _tbv._selectIndex_now=Nil;
                    }
                    
                    [self.view setUserInteractionEnabled:YES];
                    return;
                    
                }else if ([response response] ==khttpfailCode)
                {
                    
                }
                
                [self.view setUserInteractionEnabled:YES];
//                [_tbv.footerView changeState:PULLSTATEEND];
                
                
            }
                break;
                
            default:
                break;
        }
    }
}
@end
