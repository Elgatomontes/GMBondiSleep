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
#import "GMLocationManager.h"

#import "AppDelegate.h"

@interface GMMapViewController () <MKMapViewDelegate, GMLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

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
        
        [[GMLocationManager sharedInstance] addLocationObserver:self];
    }
    
    return self;
}

#pragma mark - GMLocationManagerDelegate
- (void)locationUpdated:(CLLocation *)_newLocation {

}

#pragma mark - MKMapViewDelegate
// NOTE: It does not work when app is background.
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    // Update map region to current location region if only the app is in foreground.
    if (self.mapView.userLocationVisible == NO) {
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 1000, 1000) animated:YES];
    }
}

@end
