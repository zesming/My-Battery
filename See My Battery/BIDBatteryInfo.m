//
//  BIDBatteryInfo.m
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import "BIDBatteryInfo.h"

@implementation BIDBatteryInfo

-(void) initBatteryInfoiOS7
{
    NSBundle *b = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/PowerlogLoggerSupport.framework"];
    BOOL success = [b load];
    
    if (success) {
        Class PLBatteryPropertiesEntry = NSClassFromString(@"PLBatteryPropertiesEntry");
        id info = [[PLBatteryPropertiesEntry alloc] init];
        
        self.currentCap = [info currentCapacity];
        self.maxCap = [info maxCapacity];
        NSInteger designCapacity = [info designCapacity];
        
        self.currentLevel = ((float)self.currentCap/self.maxCap) * 100;
        self.batteryTemperature = [info batteryTemp];
        
        self.instanceCurrent = [info current];
        
        self.batteryHealth = ((float)self.maxCap/designCapacity) * 100;
        NSInteger cycleCount = [info cycleCount];
        
        NSInteger voltage = [info voltage];
        NSInteger chargingCurrent = [info chargingCurrent];
        self.chargerIsPluggedIn = [info isPluggedIn];
        self.charging = [info isCharging];
        self.isFullyCharged = [info fullyCharged];
        
        
        
        self.levelMsg = [[NSString alloc] initWithFormat:@"%.2f%%", self.currentLevel];
        self.batteryTempMsg = [[NSString alloc] initWithFormat:@"%ld℃", (long)self.batteryTemperature];
       
        self.currentMsg = [[NSString alloc] initWithFormat:@"%ld mA", (long)self.instanceCurrent];
        
        self.healthMsg = [[NSString alloc] initWithFormat:@"%.2f%%", self.batteryHealth];
        self.cycleMsg = [[NSString alloc] initWithFormat:@"%ld", (long)cycleCount];
        
        self.currentCapacityMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)self.currentCap];
        self.maxMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)self.maxCap];
        self.designMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)designCapacity];
        self.voltageMsg = [[NSString alloc] initWithFormat:@"%ld mV", (long)voltage];
        self.chargingCurrentMsg = [[NSString alloc] initWithFormat:@"%ld mA", (long)chargingCurrent];
        
    }
}

@end
