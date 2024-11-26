//
//  ThemeConstants.h
//  Pods
//
//  Created by 林文益 on 2024/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 通知名称
extern NSString *const ThemeDidChangeNotification;

// 主题类型枚举
typedef NS_ENUM(NSInteger,ThemeStyle) {
    ThemeStyleLight,
    ThemeStyleDark
};

// 主题颜色
@interface ThemeConstants : NSObject

+ (UIColor *)backgroundColor:(ThemeStyle)style;
+ (UIColor *)textColor:(ThemeStyle)style;
+ (UIColor *)tintColor:(ThemeStyle)style;

@end
