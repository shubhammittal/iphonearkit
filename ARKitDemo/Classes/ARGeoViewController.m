//
//  ARGeoViewController.m
//  ARKitDemo
//
//  Created by Zac White on 8/2/09.
//  Copyright 2009 Zac White. All rights reserved.
//

#import "ARGeoViewController.h"

#import "ARGeoCoordinate.h"

@implementation ARGeoViewController

@synthesize centerLocation;

- (void)setCenterLocation:(CLLocation *)newLocation {
	centerLocation = newLocation;
	
    NSArray *coords = [self.coordinates copy];
    [self removeAllCoordinates];
	for (ARGeoCoordinate *geoLocation in coords) {
		if ([geoLocation isKindOfClass:[ARGeoCoordinate class]]) {
			[geoLocation calibrateUsingOrigin:centerLocation];
		}
	}
    [self addCoordinates:coords];
}

@end
