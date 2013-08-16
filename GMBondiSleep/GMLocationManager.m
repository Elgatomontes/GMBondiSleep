//
//  GMLocationManager.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 14/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "GMLocationManager.h"

static GMLocationManager *instance;

@interface GMLocationManager () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) NSMutableArray *locationObservers;

@end

@implementation GMLocationManager

#pragma mark - Singleton
+ (GMLocationManager *)sharedInstance {
    
    if (instance == nil) {
        instance = [[GMLocationManager alloc] init];
    }
    
    return instance;
}

#pragma mark - Life Cycle
- (void)initializeLocationManager {
    // Create the location manager.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Set the best configuration.
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    
    // TODO: this methods must be call when a region is added.
    [self.locationManager startUpdatingLocation];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
        self.locationObservers = [[NSMutableArray alloc] init];
        
        [self initializeLocationManager];
    }
    
    return self;
}

#pragma mark - Observers
- (void)addLocationObserver:(NSObject<GMLocationManagerDelegate> *)_observer {
    [self.locationObservers addObject:_observer];
}

- (void)removeLocationObserver:(NSObject<GMLocationManagerDelegate>*)_observer {
    [self.locationObservers removeObject:_observer];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    // Stop updating location for the moment.
    [self.locationManager stopUpdatingLocation];
    
    for (id locationDelegate in self.locationObservers) {
        [(NSObject <GMLocationManagerDelegate> *)locationDelegate locationUpdated:[locations objectAtIndex:0]];
    }
    
    self.locationManager.distanceFilter = 5; // Aca va la lógica para pedir que los cambios sean significativos en cuanto a posición.
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers; // Aca modifico la precisión del update según la lógica.
    
    // Start updating location in X seconds.
    [self.locationManager performSelector:@selector(startUpdatingLocation) withObject:nil afterDelay:2]; // Aca el tiempo de la próxima.
    [self.locationManager performSelectorOnMainThread:@selector(startUpdatingLocation) withObject:nil waitUntilDone:YES];
    [self.locationManager performSelectorInBackground:@selector(startUpdatingLocation) withObject:nil];
    [self.locationManager startUpdatingLocation];
    // TODO: perform selector in background mode is not working. Please look at this web: http://stackoverflow.com/questions/7703817/performselector-after-delay-doesnt-run-in-background-mode-iphone.
    // TODO: Local notifications: http://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Introduction.html
}

#pragma mark - Background monitoring.
- (void)appEnterToBackground {
    [self.locationManager startMonitoringSignificantLocationChanges];
}

- (void)appEnterToForeground {
    [self.locationManager stopMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

@end
