//
//  BIDBatteryInfo.h
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDBatteryInfo : NSObject

@property (nonatomic, strong) NSString *levelMsg, *batteryTempMsg, *currentCapacityMsg, *currentMsg, *maxMsg,  *designMsg, *cycleMsg, *voltageMsg, *healthMsg, *chargingCurrentMsg;
@property (nonatomic, assign) NSInteger currentCap, maxCap, batteryTemperature, instanceCurrent;
@property (nonatomic, assign) float currentLevel, batteryHealth;
@property (nonatomic, assign) BOOL chargerIsPluggedIn, charging, isFullyCharged;
- (void) initBatteryInfoiOS7;

@end

/* iOS7版本使用方法 */
@interface PLBatteryPropertiesEntry : NSObject
+ (id)batteryPropertiesEntry;
@property(readonly, nonatomic) BOOL draining;
@property(readonly, nonatomic) BOOL isPluggedIn;
@property(readonly, nonatomic) NSString *chargingState;
@property(readonly, nonatomic) int batteryTemp;
@property(readonly, nonatomic) NSNumber *connectedStatus;
@property(readonly, nonatomic) NSNumber *adapterInfo;
@property(readonly, nonatomic) int chargingCurrent;
@property(readonly, nonatomic) BOOL fullyCharged;
@property(readonly, nonatomic) BOOL isCharging;
@property(readonly, nonatomic) int cycleCount;
@property(readonly, nonatomic) int designCapacity;
@property(readonly, nonatomic) double rawMaxCapacity;
@property(readonly, nonatomic) double maxCapacity;
@property(readonly, nonatomic) double rawCurrentCapacity;
@property(readonly, nonatomic) double currentCapacity;
@property(readonly, nonatomic) int current;
@property(readonly, nonatomic) int voltage;
@property(readonly, nonatomic) BOOL isCritical;
@property(readonly, nonatomic) double rawCapacity;
@property(readonly, nonatomic) double capacity;
@end
