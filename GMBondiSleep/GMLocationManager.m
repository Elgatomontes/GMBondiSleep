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
    // TODO: more properties should be added.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
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
    
    for (id locationDelegate in self.locationObservers) {
        [(NSObject <GMLocationManagerDelegate> *)locationDelegate locationUpdated:[locations objectAtIndex:0]];
    }
}



@end
