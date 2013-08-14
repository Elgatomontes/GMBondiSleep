//
//  MapHomeViewController.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 11/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "UIView+LoadingView.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "GMMapViewController.h"
#import "AppDelegate.h"

@interface GMMapViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation GMMapViewController

#pragma mark - Cycle lifeStyle
- (void)initializeUserLocation {
    // Create user location
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.distanceFilter = 10;
    [self.locationManager startUpdatingLocation];
    
    // Show as loading.
    [self.view showAsLoadingView];
}

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self initializeUserLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
                                                            fromLocation:(CLLocation *)oldLocation {
    // Stop using location manager.
    [self.locationManager stopUpdatingLocation];
    
    // Update current location.
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500) animated:YES];
    
    // Stop showing as loading.
    [self.view stopShowingAsLoading];
}

@end
