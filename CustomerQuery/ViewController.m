//
//  ViewController.m
//  CustomerQuery
//
//  Created by apple on 2018/12/3.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "ViewController.h"
#import "HttpRequest.h"
#import "CompanyListViewController.h"
#import "util/ToastUtils.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UITextField *appId;

@end

@implementation ViewController
- (IBAction)query:(id)sender {
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"CompanyListView"];
//    //    [self presentViewController:mainViewController animated:YES completion:^{
//    //            }];
//    [self.navigationController pushViewController:mainViewController animated:YES];
    
    
    //用模态跳转到主界面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"CompanyListView"];
    NSString *sEmail=_email.text;
    NSString *sCompanyName=_companyName.text;
    NSString *sAppid=_appId.text;
    if ([@"" isEqualToString:sEmail]&&[@"" isEqualToString:sCompanyName]&&[@"" isEqualToString:sAppid]) {
        __block UITextView *toastView = [[UITextView alloc] init];
        toastView=[ToastUtils toastTip:@"输入为空" withToast:toastView];
        [self.view addSubview:toastView];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
        
        dispatch_after(popTime, dispatch_get_main_queue(), ^() {
            [toastView removeFromSuperview];
            toastView = nil;
        });
    }else{
        [mainViewController setValue:sEmail forKey:@"email"];
        [mainViewController setValue:sCompanyName forKey:@"companyName"];
        [mainViewController setValue:sAppid forKey:@"appId"];
        
        [self.navigationController pushViewController:mainViewController animated:YES];
    }
    
//    [self presentViewController:mainViewController animated:YES completion:^{
//    }];
    
    //printf("good afternoon");
    
    //[self performSegueWithIdentifier:@"mySegue" sender:nil];
    
    //NSLog(@"%@",sEmail);
    
//    HttpRequest *httpRequest=[HttpRequest new];
//    [httpRequest httpGet];
    //[self finish];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSString *sEmail=_email.text;
//    NSString *sCompanyName=_companyName.text;
//    NSString *sAppid=_appId.text;
//    UIViewController *send=segue.destinationViewController;
//    if ([send respondsToSelector:@selector(setEmail:)]) {
//        [send setValue:sEmail forKey:@"email"];
//        [send setValue:sCompanyName forKey:@"companyName"];
//        [send setValue:sAppid forKey:@"appId"];
//    }
//}

- (void)finish {NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];[tmpArray removeObject:self];[self.navigationController setViewControllers:tmpArray];}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    [btn addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    
//    CGRect frameInNaviView = [self.navigationController.view convertRect:btn.frame fromView:btn.superview];
//
//    UIView *vShow = [[UIView alloc] initWithFrame:frameInNaviView];
//    vShow.backgroundColor = [UIColor redColor];
//    [self.navigationController.view addSubview:vShow];
    

    //self.navigationItem.rightBarButtonItem.title=@"退出登录";
}

-(void) logout:(UIButton *) btn{
    [self removeLoginInfo];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    
    [self presentViewController:mainViewController animated:YES completion:^{
    }];
}

-(void) removeLoginInfo {
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
}


@end
