//
//  SecondTableViewCell.m
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "SecondTableViewCell.h"

@interface SecondTableViewCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * label3;
@end
@implementation SecondTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            
        }];
        [self.contentView addSubview:self.label3];
        [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(85);
            make.height.mas_equalTo(24);
        }];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(self.label3.left).mas_offset(-5);
            make.centerY.mas_equalTo(0);
            
        }];
        
        
        
    }
    return self;
}

- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = UIFont(16);
        _titleLabel.textColor = UIColor(51, 51, 51, 1);
        _titleLabel.text = @"黄金";
    }
    return _titleLabel;
}

- (UILabel *) contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 1;
        _contentLabel.font = UIFont(14);
        _contentLabel.textColor = [UIColor redColor];
        _contentLabel.text = @"1332.98";
    }
    return _contentLabel;
}

- (UILabel *) label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.textAlignment = NSTextAlignmentCenter;
        _label3.numberOfLines = 1;
        _label3.font = UIFont(14);
        _label3.backgroundColor = [UIColor redColor];
        _label3.textColor = [UIColor whiteColor];
        _label3.layer.cornerRadius = 5;
        _label3.layer.masksToBounds = YES;
        _label3.text = @"+0.63%";
    }
    return _label3;
}

@end
