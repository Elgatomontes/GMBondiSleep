//
//  AppDelegate.h
//  GMBondiSleep
//
//  Created by Gastón Montes on 18/07/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    kMapViewController = 0,
    kFavouriteViewController,
    kHowToViewController,
    kThanksViewController
    
}kSectionViewControllerType;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
