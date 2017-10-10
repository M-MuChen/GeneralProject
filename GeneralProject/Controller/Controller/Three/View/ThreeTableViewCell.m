//
//  ThreeTableViewCell.m
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "ThreeTableViewCell.h"

@interface ThreeTableViewCell ()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;

@end

@implementation ThreeTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.mas_equalTo(10);
            make.width.height.mas_equalTo(70);
            make.bottom.mas_equalTo(-10);
            
        }];
        
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.iconImageView.right).mas_offset(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(12);
            
        }];
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.iconImageView.right).mas_offset(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.titleLabel.bottom).mas_offset(8);
            
        }];
        
    }
    return self;
}

- (UIImageView *) iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
//        _iconImageView.image = [UIImage imageNamed:@"timg"];
    }
    return _iconImageView;
}

- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = UIFont(16);
        _titleLabel.textColor = UIColor(51, 51, 51, 1);
//        _titleLabel.text = @"ystemgroup.com.ystemgroup.com.ystemgroup.com.ystemgroup.com.";
    }
    return _titleLabel;
}

- (UILabel *) contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 1;
        _contentLabel.font = UIFont(14);
        _contentLabel.textColor = UIColor(102, 102, 102, 1);
//        _contentLabel.text = @"data/Containers/Shared/";
    }
    return _contentLabel;
}



- (void)setDataDict:(NSDictionary *)dataDict {
    
    _dataDict = dataDict;
    
    NSString *imgUrl = [dataDict objectForKey:@"imgurl"];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    self.titleLabel.text = [dataDict objectForKey:@"title"];
    self.contentLabel.text = [dataDict objectForKey:@"source"];
//    self..text = [dataDict objectForKey:@"source"];
    
}



@end
