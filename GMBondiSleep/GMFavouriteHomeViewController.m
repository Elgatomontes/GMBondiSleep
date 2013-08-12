//
//  GMFavouriteHomeViewController.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 11/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "GMFavouriteHomeViewController.h"
#import "AppDelegate.h"

@interface GMFavouriteHomeViewController ()

@end

@implementation GMFavouriteHomeViewController

#pragma mark - Cycle lifeStyle
- (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"TabBarItem.Favourite", nil)
                                                                    image:[UIImage imageNamed:@"favourite.png"]
                                                                      tag:kFavouriteViewController];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
