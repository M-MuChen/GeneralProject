//
//  BaseViewController.h
//  旅业圈
//
//  Created by wangDC on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *rightBtn;

- (void) setNavigationBarColor:(UIColor *) color;

//设置左按钮
- (void) setLeftButtonText:(NSString * ) text;
- (void) setLeftButtonImage:(NSString * ) image;
- (void) leftButtonClicked:(UIButton *) button;  //需要时，在子类重写
- (void) hiddenLeftButton;  //隐藏左按钮

//设置右按钮
- (void) setRightButtonText:(NSString * ) text;
- (void) setRightButtonImage:(NSString * ) image;
- (void) rightButtonClicked:(UIButton *) button; //需要时，在子类重写
- (void) hiddenRightButton; //隐藏右按钮

//当前导航控制器
@property (nonatomic, weak) UIViewController *currentShowVC;

@end
