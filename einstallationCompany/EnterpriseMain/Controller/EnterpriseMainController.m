//
//  MainViewController.m
//  com.chengdushanghai.einstallation
//
//  Created by 云位 on 2021/4/1.
//

#import "EnterpriseMainController.h"
#import "GrabOrderTabViewController.h"
#import "EnterpriseNavController.h"
#import "WaitTaskListController.h"
#import "InstallTaskController.h"
#import "PayTypeViewController.h"
#import "InstallStatisticViewController.h"
#import "SVProgressHUD.h"
#import "APIConst.h"
#import "EnterpriseLoginController.h"
#import "EnterpriseMainService.h"
#import "WebController.h"
#import "AppDelegate.h"
#import "DialogTwoButtonView.h"
#import "UIView+Extension.h"
#import "EnterpriseNoticeController.h"


@interface EnterpriseMainController ()

@end

@implementation EnterpriseMainController




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self checkVersion];
    [self requstMainNum];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 创建一个点击事件，点击时触发labelClick方法
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(labelClick4)];
    // 2. 将点击事件添加到label上
    [self.vNOAcceptTask addGestureRecognizer:labelTapGestureRecognizer];
    self.vNOAcceptTask.userInteractionEnabled = YES; // 可以理解为设置label可被点击//
    
    
    
    labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(labelClick2)];
    // 2. 将点击事件添加到label上
    [self.vTimeOutTask addGestureRecognizer:labelTapGestureRecognizer];
    self.vTimeOutTask.userInteractionEnabled = YES;
    
    
    
    UITapGestureRecognizer *labelTapGestureRecognizer1 = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(noticeClick)];
    // 2. 将点击事件添加到label上
    [self.vCircle01 addGestureRecognizer:labelTapGestureRecognizer1];
    self.vCircle01.userInteractionEnabled = YES;

    
    
    labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(labelClick1)];

    [self.vCircle03 addGestureRecognizer:labelTapGestureRecognizer];
    self.vCircle03.userInteractionEnabled = YES; //
    labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(labelClick4)];
 
    [self.vCircle02 addGestureRecognizer:labelTapGestureRecognizer];
    self.vCircle02.userInteractionEnabled = YES; //
    labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(noticeClick1)];
  
    [self.vNotice01 addGestureRecognizer:labelTapGestureRecognizer];
    self.vNotice01.userInteractionEnabled = YES; //
    
    
    labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self action:@selector(noticeClick2)];

    [self.vNotice02 addGestureRecognizer:labelTapGestureRecognizer];
    self.vNotice02.userInteractionEnabled = YES; //
   
}

- (void)labelClick {
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    if(userID.length>0){
        GrabOrderTabViewController * vc = [GrabOrderTabViewController alloc];
        vc.hidesBottomBarWhenPushed = YES;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [SVProgressHUD showInfoWithStatus:@"暂未登录，请先登录！"];
        EnterpriseLoginController *vc = [[EnterpriseLoginController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (void)noticeClick {
    EnterpriseNoticeController * vc = [EnterpriseNoticeController alloc];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
   
}

- (void)labelClick1 {
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    if(userID.length>0){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.tabBarVC.selectedIndex = 1;
    }else{
        [SVProgressHUD showInfoWithStatus:@"暂未登录，请先登录！"];
        EnterpriseLoginController *vc = [[EnterpriseLoginController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (void)labelClick2 {
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    if(userID.length>0){
        InstallTaskController *vc = [[InstallTaskController alloc]init];
        vc.position = 3;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        [SVProgressHUD showInfoWithStatus:@"暂未登录，请先登录！"];
        EnterpriseLoginController *vc = [[EnterpriseLoginController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (void)labelClick4 {
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    if(userID.length>0){
        InstallTaskController *vc = [[InstallTaskController alloc]init];
        vc.position = 0;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        [SVProgressHUD showInfoWithStatus:@"暂未登录，请先登录！"];
        EnterpriseLoginController *vc = [[EnterpriseLoginController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (void)labelClick3 {
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    if(userID.length>0){
        InstallStatisticViewController *vc = [[InstallStatisticViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [SVProgressHUD showInfoWithStatus:@"暂未登录，请先登录！"];
        EnterpriseLoginController *vc = [[EnterpriseLoginController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}


- (void)noticeClick1 {
    if(self.mainNumModel.Noticearr.count>0){
        WebController *vc = [[WebController alloc]init];
        vc.pageType = 1;
        vc.url = [self.mainNumModel.Noticearr objectAtIndex:0].url;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];}
    
}


- (void)noticeClick2 {
    if(self.mainNumModel.Noticearr.count>1){
        WebController *vc = [[WebController alloc]init];
        vc.pageType = 1;
        vc.url = [self.mainNumModel.Noticearr objectAtIndex:1].url;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];}
    
}

-(void)requstMainNum{
    NSString * userID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_USERID];
    NSString * parentID = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_PARENTID];
    NSString * browseType = [[NSUserDefaults standardUserDefaults] valueForKey:ENTERPRISE_BROWSETYPE];
    if(userID.length>0){
        NSDictionary *dic = @{@"userid":userID,
                              @"ParentID":parentID,
                              @"Browsetype":browseType,
                              @"version":[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
        };
        [EnterpriseMainService requestMainNum:dic andResultBlock:^(id  _Nonnull data, id  _Nonnull error) {
            if (data) {
                self.mainNumModel = data;
                self.labelNum01.text = self.mainNumModel.acceptnum;
                self.labelNum02.text = self.mainNumModel.overtimenum;
                
                if(self.mainNumModel.Noticearr.count==0){
                    self.labelTitle01.text = @"暂无信息";
                    self.labelContent01.text = @"近期无通知";
                    
                    self.labelTitle02.text = @"暂无信息";
                    self.labelContent02.text = @"近期无通知";
                    self.vNotice01.userInteractionEnabled = NO;
                    self.vNotice02.userInteractionEnabled = NO;
                }else if(self.mainNumModel.Noticearr.count==1){
                    self.labelTitle01.text = [self.mainNumModel.Noticearr objectAtIndex:0].title;
                    self.labelContent01.text = [self.mainNumModel.Noticearr objectAtIndex:0].profile;
                    
                    self.labelTitle02.text = @"暂无信息";
                    self.labelContent02.text = @"近期无通知";
                    self.vNotice02.userInteractionEnabled = NO;
                }else{
                    self.labelTitle01.text = [self.mainNumModel.Noticearr objectAtIndex:0].title;
                    self.labelContent01.text = [self.mainNumModel.Noticearr objectAtIndex:0].profile;
                    
                    self.labelTitle02.text = [self.mainNumModel.Noticearr objectAtIndex:1].title;
                    self.labelContent02.text = [self.mainNumModel.Noticearr objectAtIndex:1].profile;
                }
                
            }
        }];
    }
    
    
}


- (void)showTwoDialogView:(NSString *) strContent withRightButtonTitle:(NSString *) strRightButtonName
     withLeftButtonTitle:(NSString *) strLeftButtonName{
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    DialogTwoButtonView *view = [DialogTwoButtonView LoadView_FromXib];
    view.frame = window.frame;
    view.laContent.text = strContent;
    [view.btLeft setTitle:strLeftButtonName forState:UIControlStateNormal];
    [view.btRight setTitle:strRightButtonName forState:UIControlStateNormal];
        CGFloat itemHeight = [(NSString *)strContent boundingRectWithSize:CGSizeMake((SCREENWIDTH-80), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    view.constraintViewHeight.constant = 220+itemHeight;
    __weak typeof(view) weakView = view;
    view.confirmBlock  = ^{
        NSString *str = @"itms-apps://itunes.apple.com/cn/app/id1586066452?mt=8"; //更换id即可
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
    };
    view.cancelBlock = ^{
        [weakView removeFromSuperview];
        exit(0);
    };
    [window addSubview:view];
}

//版本

-(NSString *)version

{

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];

    NSString *app_Version       = [infoDictionary objectForKey:@"CFBundleShortVersionString"];

    return app_Version;

}

/// 检查版本更新
- (void)checkVersion {
    NSURL * url = [NSURL URLWithString:@"https://itunes.apple.com/cn/lookup?id=1586066452"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(data!=nil){
            NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if(dataDic!=nil && [dataDic objectForKey:@"results"] ){
                NSArray *results = dataDic[@"results"];
                if (results && results.count > 0) {
                    NSDictionary *response = results.firstObject;
                    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]; // 软件的当前版本
                    NSString *lastestVersion = response[@"version"]; // AppStore 上软件的最新版本
                    if (currentVersion && lastestVersion && ![self isLastestVersion:currentVersion compare:lastestVersion]) {
                        
                        NSString * alertContent = [NSString stringWithFormat:@"发现新版本v%@，为保证软件的正常运行，请及时更新到最新版本！",lastestVersion];
                        // 给出提示是否前往 AppStore 更新
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI更新代码
                            [self showTwoDialogView:alertContent withRightButtonTitle:@"立即更新" withLeftButtonTitle:@"我再想想"];
                        });
                        
                        
                    }
                }}}
    }] resume];
}

/// 判断是否最新版本号（大于或等于为最新）
- (BOOL)isLastestVersion:(NSString *)currentVersion compare:(NSString *)lastestVersion {
    if (currentVersion && lastestVersion) {
        // 拆分成数组
        NSMutableArray *currentItems = [[currentVersion componentsSeparatedByString:@"."] mutableCopy];
        NSMutableArray *lastestItems = [[lastestVersion componentsSeparatedByString:@"."] mutableCopy];
        // 如果数量不一样补0
        NSInteger currentCount = currentItems.count;
        NSInteger lastestCount = lastestItems.count;
        if (currentCount != lastestCount) {
            NSInteger count = labs(currentCount - lastestCount); // 取绝对值
            for (int i = 0; i < count; ++i) {
                if (currentCount > lastestCount) {
                    [lastestItems addObject:@"0"];
                } else {
                    [currentItems addObject:@"0"];
                }
            }
        }
        // 依次比较
        BOOL isLastest = YES;
        for (int i = 0; i < currentItems.count; ++i) {
            NSString *currentItem = currentItems[i];
            NSString *lastestItem = lastestItems[i];
            if (currentItem.integerValue != lastestItem.integerValue) {
                isLastest = currentItem.integerValue > lastestItem.integerValue;
                break;
            }
        }
        return isLastest;
    }
    return NO;
}


@end
