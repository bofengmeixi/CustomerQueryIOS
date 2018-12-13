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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UITextField *appId;

@end

@implementation ViewController
- (IBAction)query:(id)sender {
    //printf("good afternoon");
    
    //[self performSegueWithIdentifier:@"mySegue" sender:nil];
    
    //NSLog(@"%@",sEmail);
    
//    HttpRequest *httpRequest=[HttpRequest new];
//    [httpRequest httpGet];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *sEmail=_email.text;
    NSString *sCompanyName=_companyName.text;
    NSString *sAppid=_appId.text;
    UIViewController *send=segue.destinationViewController;
    if ([send respondsToSelector:@selector(setEmail:)]) {
        [send setValue:sEmail forKey:@"email"];
        [send setValue:sCompanyName forKey:@"companyName"];
        [send setValue:sAppid forKey:@"appId"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
