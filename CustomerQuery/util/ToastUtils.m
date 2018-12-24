//
//  ToastUtils.m
//  CustomerQuery
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "ToastUtils.h"

@implementation ToastUtils
/*获取指定宽度width的字符串在UITextView上的高度

@param textView 待计算的UITextView
@param width 限制字符串显示区域的宽度
@return 返回的高度
*/
+ (float)heightForString:(UITextView *)textView andWidth:(float)width {
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}
#pragma mark - 显示提示信息
+ (UITextView *)toastTip:(NSString *)toastInfo withToast:(UITextView *) toastView {
    CGRect frameRC = [[UIScreen mainScreen] bounds];
    frameRC.origin.y = frameRC.size.height/2+40;
    frameRC.origin.x=frameRC.size.width/2-30;
    //frameRC.size.height -= 110;
    
    
    toastView.editable = NO;
    toastView.selectable = NO;
    frameRC.size.width=60;
    frameRC.size.height = [self heightForString:toastView andWidth:frameRC.size.width];
    
    toastView.frame = frameRC;
    
    toastView.text = toastInfo;
    toastView.backgroundColor = [UIColor blackColor];
    toastView.textColor=[UIColor whiteColor];
    //toastView.alpha = 0.2;
    
    return toastView;
    
}


@end
