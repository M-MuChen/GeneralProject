//
//  FirstTableViewCell.m
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "FirstTableViewCell.h"

@interface FirstTableViewCell ()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * timeLabel;

@end

@implementation FirstTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.mas_equalTo(10);
            make.width.height.mas_equalTo(70);
            
        }];
        
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.iconImageView.right).mas_offset(5);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(15);
            
        }];
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.iconImageView.right).mas_offset(5);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.titleLabel.bottom).mas_offset(8);
            
        }];
        
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.iconImageView.right).mas_offset(5);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.contentLabel.bottom).mas_offset(5);
            make.bottom.mas_equalTo(-15);
            
        }];
        
    }
    return self;
}

- (UIImageView *) iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"timg"];
    }
    return _iconImageView;
}

- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = UIFont(16);
        _titleLabel.textColor = UIColor(51, 51, 51, 1);
        _titleLabel.text = @"ystemgroup.com.";
    }
    return _titleLabel;
}

- (UILabel *) contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = UIFont(14);
        _contentLabel.textColor = UIColor(102, 102, 102, 1);
        _contentLabel.text = @"data/Containers/Shared/";
    }
    return _contentLabel;
}

- (UILabel *) timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.numberOfLines = 1;
        _timeLabel.font = UIFont(10);
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.text = @"12F3C885BBB5";
    }
    return _timeLabel;
}
@end
