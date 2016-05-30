//
//  AppDelegate.m
//  SinaApp_MVC
//
//  Created by SuperWang on 16/5/18.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "AppDelegate.h"

#import "SinaViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    UITabBarController *rootTabBarController = [[UITabBarController alloc]init];
    //sina
    SinaViewController *sinaViewController = [[SinaViewController alloc]init];
    sinaViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:nil tag:0];

    //message
    MessageViewController *messageViewController = [[MessageViewController alloc]init];
    messageViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:nil tag:1];

    //search
    SearchViewController *searchViewController = [[SearchViewController alloc]init];
    searchViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"搜索" image:nil tag:2];
    
    //setting
    SettingViewController *settingViewController = [[SettingViewController alloc]init];
    settingViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:nil tag:3];
    
    //填充
    rootTabBarController.viewControllers = @[sinaViewController,messageViewController,searchViewController,settingViewController];
    
    
    self.window.rootViewController = rootTabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
