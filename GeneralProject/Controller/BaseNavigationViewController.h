//
//  BaseNavigationViewController.h
//  旅业圈
//
//  Created by wangDC on 2017/3/28.
//
//

#import <UIKit/UIKit.h>

@interface BaseNavigationViewController : UINavigationController <UITabBarDelegate>
- (void) setTitle:(NSString*) title andImage:(NSString * ) img andSelectedImage:(NSString*) selectedImg;
@end
