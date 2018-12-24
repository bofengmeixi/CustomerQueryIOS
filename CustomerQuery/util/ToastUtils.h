//
//  ToastUtils.h
//  CustomerQuery
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToastUtils : NSObject
+ (UITextView *)toastTip:(NSString *)toastInfo withToast:(UITextView *) toastView;
@end

NS_ASSUME_NONNULL_END
