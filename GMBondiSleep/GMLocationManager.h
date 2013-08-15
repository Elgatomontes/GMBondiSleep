//
//  GMLocationManager.h
//  GMBondiSleep
//
//  Created by Gastón Montes on 14/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "GMBaseObject.h"

@protocol GMLocationManagerDelegate <NSObject>

- (void)locationUpdated:(CLLocation *)_newLocation;

@end

@interface GMLocationManager : GMBaseObject

+ (GMLocationManager *)sharedInstance;

- (void)addLocationObserver:(NSObject<GMLocationManagerDelegate> *)_observer;
- (void)removeLocationObserver:(NSObject<GMLocationManagerDelegate>*)_observer;

@end
