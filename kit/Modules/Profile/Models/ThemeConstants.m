//
//  ThemeConstants.m
//  Pods
//
//  Created by 林文益 on 2024/11/20.
//

#import "ThemeConstants.h"

NSString *const ThemeDidChangeNotification = @"ThemeDidChangeNotification";

@implementation ThemeConstants

+ (UIColor *)backgroundColor:(ThemeStyle)style {
    return style == ThemeStyleLight ? UIColor.whiteColor : UIColor.blackColor;
}

+ (UIColor *)textColor:(ThemeStyle)style {
    return style == ThemeStyleLight ? UIColor.blackColor : UIColor.whiteColor;
}

+ (UIColor *)tintColor:(ThemeStyle)style {
    return style == ThemeStyleLight ? [UIColor systemBlueColor] : [UIColor systemCyanColor];
}

@end
