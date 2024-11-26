//
//  AppDelegate.m
//  kit
//
//  Created by 林文益 on 2024/11/14.
//

#import "AppDelegate.h"
#import "CustomViewController.h"
#import "ComponentsViewController.h"
#import "SettingsViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_3D" object:nil];
    

    // 1. 创建窗口，大小设置为手机屏幕大小
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    CustomViewController *customVC = [[CustomViewController alloc]init];
    UINavigationController *customNav = [[UINavigationController alloc] initWithRootViewController:customVC];
    customNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"控件" image:[UIImage systemImageNamed:@"person"] selectedImage:[UIImage systemImageNamed:@"preson.fill"]];
    
    
    SettingsViewController *settingsVC = [[SettingsViewController alloc]init];
    UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:settingsVC];
    settingsNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage systemImageNamed:@"gear"] selectedImage:[UIImage systemImageNamed:@"gear.fill"]];
    
    tabBarController.viewControllers = @[customNav,settingsNav];

    
    self.window.rootViewController = tabBarController;
    
    // 6. 设置为主窗口并显示
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
