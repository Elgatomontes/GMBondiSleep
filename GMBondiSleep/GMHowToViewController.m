//
//  GMHowToViewController.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 11/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "GMHowToViewController.h"
#import "AppDelegate.h"

@interface GMHowToViewController ()

@end

@implementation GMHowToViewController

#pragma mark - Cycle lifeStyle
- (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"TabBarItem.HowTo", nil)
                                                                image:[UIImage imageNamed:@"howTo.png"]
                                                                  tag:kHowToViewController];
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
