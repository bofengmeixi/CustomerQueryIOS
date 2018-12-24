//
//  CQPointHUD.h
//  CustomerQuery
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQPointHUD : UIView

/** 纯文本toast提示 */
+ (void)showToastWithMessage:(NSString *)message;

/** 图文toast提示 */
+ (void)showToastWithMessage:(NSString *)message image:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
