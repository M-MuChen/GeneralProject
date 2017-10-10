//
//  ThreeTableViewCellModel.h
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import <Foundation/Foundation.h>

@interface ThreeTableViewCellModel : NSObject

@property (nonatomic, strong) NSString * iconImage;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * content;

- (instancetype) initWithIconImage:(NSString*) icon title:(NSString *) title content:(NSString *) content;

@end
