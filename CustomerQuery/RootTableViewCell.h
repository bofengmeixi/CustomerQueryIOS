//
//  RootTableViewCell.h
//  CustomerQuery
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *companyNameLabel;

@property (nonatomic, strong) UILabel *versionLabel;

@property (nonatomic, strong) UILabel *companyIdLabel;

@property (nonatomic, strong) UILabel *eventLimitLabel;

@property (nonatomic, strong) UILabel *stopTimeLabel;
@end

NS_ASSUME_NONNULL_END
