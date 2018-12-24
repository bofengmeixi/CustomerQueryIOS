//
//  LoginViewController.m
//  CustomerQuery
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "LoginViewController.h"
#import "network/HttpRequest.h"
#import "CQPointHUD.h"
#import "ToastUtils.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)login:(id)sender {
    //获取用户输入的信息
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    HttpRequest *httpRequest=[HttpRequest new];
    
    NSString *result=[httpRequest login:username withPassword:password];
    if ([@"OK" isEqualToString:result]) {
        //获取userDefault单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //登陆成功后把用户名和密码存储到UserDefault
        [userDefaults setObject:username forKey:@"name"];
        [userDefaults setObject:password forKey:@"password"];
        [userDefaults synchronize];
        //用模态跳转到主界面
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainView"];
        
        [self presentViewController:mainViewController animated:YES completion:^{
        }];
        [self finish];
    }else{
        __block UITextView *toastView = [[UITextView alloc] init];
        toastView=[ToastUtils toastTip:@"登录失败" withToast:toastView];
        [self.view addSubview:toastView];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
        
        dispatch_after(popTime, dispatch_get_main_queue(), ^() {
            [toastView removeFromSuperview];
            toastView = nil;
        });
        //[self toastTip:@"登录失败"];
        //NSLog(@"login failed");
        //[CQPointHUD showToastWithMessage:@"登录失败"];
    }
    
    
    
    
    //对用户信息的验证
//    if ([username isEqualToString:password]){
//        //获取userDefault单例
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//
//        //登陆成功后把用户名和密码存储到UserDefault
//        [userDefaults setObject:username forKey:@"name"];
//        [userDefaults setObject:password forKey:@"password"];
//        [userDefaults synchronize];
//        //用模态跳转到主界面
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//
//        id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainView"];
//
//        [self presentViewController:mainViewController animated:YES completion:^{
//        }];
//    }
}


- (void)finish {NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];[tmpArray removeObject:self];[self.navigationController setViewControllers:tmpArray];}


/**


//-(void) verifyLoginInfo()

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
