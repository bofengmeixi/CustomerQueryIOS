//
//  RootTableViewCell.m
//  CustomerQuery
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽度
    float width = bounds.size.width;
    
    // 1.公司名称
    self.companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 2*width/3, 30)];
    self.companyNameLabel.textColor = [UIColor blueColor];
    //    self.headerImageView.backgroundColor = [UIColor orangeColor];
    //self.companyNameLabel.layer.masksToBounds = YES;
    //self.companyNameLabel.layer.cornerRadius = 50;
    // cell提供了一个contentView的属性，专门用来自定义cell,防止在cell布局的时候发生布局混乱，如果是自定义cell，记得将子控件添加到ContentView上
    [self.contentView addSubview:self.companyNameLabel];
    
    //2.版本
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(width-120, CGRectGetMinY(self.companyNameLabel.frame), 100, 30)];
    //self.versionLabel.autoresizingMask=UIViewAutoresizingFlexibleRightMargin;
    //self.versionLabel.autoresizingMask=UIViewContentModeRight;
    //[self.versionLabel makeTextWritingDirectionRightToLeft:self.versionLabel];
    
    [self.contentView addSubview:self.versionLabel];

    //3.公司id
    self.companyIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.companyNameLabel.frame), CGRectGetMaxY(self.companyNameLabel.frame) , width/2-10, 30)];
    //[self.companyIdLabel sizeToFit];
    [self.contentView addSubview:self.companyIdLabel];
    
    //4.月事件量
    self.eventLimitLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/2-20, CGRectGetMinY(self.companyIdLabel.frame), width/2, 30)];
    //[self.eventLimitLabel sizeToFit];
    [self.contentView addSubview:self.eventLimitLabel];
    
    //5.到期时间
    self.stopTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.companyIdLabel.frame), CGRectGetMaxY(self.companyIdLabel.frame) , width, 30)];
    
    [self.contentView addSubview:self.stopTimeLabel];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
