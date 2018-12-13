//
//  CompanyListViewController.m
//  CustomerQuery
//
//  Created by apple on 2018/12/4.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "CompanyListViewController.h"
#import "RootTableViewCell.h"
#import "HttpRequest.h"

@interface CompanyListViewController ()
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *appId;
@end

@implementation CompanyListViewController
@synthesize arrayData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //arrayData = [NSArray arrayWithObjects:@"王小虎 z",@"郭二牛",@"宋小六",@"耿老三",@"曹大将军", nil];
    
    HttpRequest *httpRequest=[HttpRequest new];
    NSString *content;
    NSLog(@"%@",_appId);
    if (_email!=nil&&![_email isEqualToString:@""]) {
        NSString *url=@"http://54.222.236.168:8084/v1/email/";
        content=[httpRequest httpGet:url parameters:_email];
    }else if(_appId!=nil&&![_appId isEqualToString:@""]){
        NSString *url=@"http://54.222.236.168:8084/v1/app/";
        content=[httpRequest httpGet:url parameters:_appId];
    }else if (_companyName!=nil&&![_companyName isEqualToString:@""]){
        NSString *url=@"http://54.222.236.168:8084/v1/name/";
        content=[httpRequest httpGet:url parameters:_companyName];
    }
    if (content!=nil) {
        NSArray *array=[self toArrayOrNSDictionary:content];
        if (array!=nil) {
            arrayData=array;
        }
    }
}

-  (id)toArrayOrNSDictionary:(NSString *)jsonString{
    
    NSData *jsonData=[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}


- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
    
}



- (CGFloat)tableView:(UITableView *)tableView widthForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽度
    float width = bounds.size.width;
    return width;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        cell = [[RootTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
    
    //cell.textLabel.text = [arrayData objectAtIndex:indexPath.row];
//    cell.companyNameLabel.text=@"北京乐享天下科技有限公司";
//    cell.companyIdLabel.text=@"公司id:123332";
//    cell.versionLabel.text=@"国旗班";
//    cell.eventLimitLabel.text=@"约时间量:200000";
//    cell.stopTimeLabel.text=@"到期时间:2018-2-3 12:00:00";
    NSDictionary *dic=arrayData[indexPath.row];
    NSString *id=[@"公司id：" stringByAppendingString:dic[@"id"]];
    NSString *version=dic[@"version"];
    if ([@"1" isEqualToString:version]) {
        version=@"过期版";
    }else if([@"9" isEqualToString:version]){
        version=@"基础版";
    }else if([@"10" isEqualToString:version]){
        version=@"专业版";
    }else if([@"11" isEqualToString:version]){
        version=@"企业版";
    }
    NSString *eventLimit=[@"月事件量：" stringByAppendingString:dic[@"discount_event_limit"]];
    NSString *stopTime=[@"到期时间：" stringByAppendingString:dic[@"version_stop_time"]];
    cell.companyNameLabel.text=dic[@"company_name"];
    cell.companyIdLabel.text=id;
    cell.versionLabel.text=version;
    cell.eventLimitLabel.text=eventLimit;
    cell.stopTimeLabel.text=stopTime;
    
    //cell的右边有一个小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
