//
//  BIDBatteryInfo.h
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDBatteryInfo : NSObject

@property (nonatomic, strong) NSString *levelMsg, *batteryTempMsg, *currentCapacityMsg, *currentMsg, *maxMsg,  *designMsg, *cycleMsg, *voltageMsg, *healthMsg, *chargingCurrentMsg, *manufacturerMsg, *serialNumberMsg;
@property (nonatomic, assign) NSInteger currentCap, maxCap, instanceCurrent;
@property (nonatomic, assign) float currentLevel, batteryHealth, batteryTemperature;
@property (nonatomic, assign) BOOL chargerIsPluggedIn, charging, isFullyCharged;
- (void) getBatteryInfo;

@end
