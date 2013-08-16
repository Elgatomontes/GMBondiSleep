//
//  AppDelegate.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 18/07/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "AppDelegate.h"

#import "GMLocationManager.h"
#import "GMMapViewController.h"
#import "GMHowToViewController.h"
#import "GMThanksContactViewController.h"
#import "GMFavouriteHomeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create tab bar items.
    GMMapViewController *mapSection = [[GMMapViewController alloc] init]; // Map.
    GMFavouriteHomeViewController *favouriteSection = [[GMFavouriteHomeViewController alloc] init]; // Favourite.
    GMHowToViewController *howToSection = [[GMHowToViewController alloc] init];// How to.
    GMThanksContactViewController *thanksSection = [[GMThanksContactViewController alloc] init]; // Thanks and Contact.
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[mapSection,
                                              favouriteSection,
                                              howToSection,
                                              thanksSection];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[GMLocationManager sharedInstance] appEnterToForeground];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[GMLocationManager sharedInstance] appEnterToBackground];
}

@end
