//
//  ThreeTableViewCellModel.m
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "ThreeTableViewCellModel.h"

@implementation ThreeTableViewCellModel

- (instancetype) initWithIconImage:(NSString*) icon title:(NSString *) title content:(NSString *) content {
    if (self = [super init]) {
        self.iconImage = icon;
        self.title = title;
        self.content = content;
    }
    return self;
}

@end
