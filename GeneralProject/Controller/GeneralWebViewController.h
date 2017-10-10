//
//  GeneralWebViewController.h
//  GeneralProject
//
//  Created by Hanxiaojie on 2017/10/9.
//

#import "BaseViewController.h"

@interface GeneralWebViewController : BaseViewController

- (instancetype) initWithUrl:(NSString *) url;
- (instancetype) initWithHtml:(NSString *) html;

@end
