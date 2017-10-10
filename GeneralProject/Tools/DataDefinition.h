
// 颜色
#define RGBColor(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define RGBHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBAHexColor(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbaValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbaValue & 0xFF))/255.0 alpha:((rgbaValue >> 24) / 255.0)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LineViewColor UIColor(226, 226, 226, 1)



//屏幕尺寸
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCALE [[UIScreen mainScreen] bounds].size.width / 320
#define UIScale(x) x * SCALE
//Plist文件存储
#define kUserDefault(object, key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]
#define gainUserDefault(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

//字符串转换
#define ToString(x) [NSString stringWithFormat:@"%@",x]
#define UIColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIFont(x) [UIFont systemFontOfSize:x]
#define CheckString(object) [CommonClass stringJudgeisNull:object]

//视图控制器推出
#define PushViewController(controller) [self.navigationController pushViewController:controller animated:YES]
#define PopViewController [self.navigationController popViewControllerAnimated:YES]
#define PopToRootViewController [self.navigationController popToRootViewControllerAnimated:YES]
#define PopToViewController(x) [self popToViewController:x]

//判断用户是否登录  1为登录
#define LoginState gainUserDefault(@"loginState")












