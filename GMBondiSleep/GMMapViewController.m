//
//  MapHomeViewController.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 11/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "GMMapViewController.h"
#import "AppDelegate.h"

@interface GMMapViewController ()

@end

@implementation GMMapViewController

#pragma mark - Cycle lifeStyle
- (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"TabBarItem.Map", nil)
                                                              image:[UIImage imageNamed:@"map.png"]
                                                                tag:kMapViewController];
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
