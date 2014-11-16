//
//  BIDBatteryInfo.m
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import "BIDBatteryInfo.h"

@implementation BIDBatteryInfo

-(void) getBatteryInfo
{
    NSDictionary *batteryStatus = [[NSDictionary alloc] initWithContentsOfFile:@"/tmp/batteryStatus.plist"];
    
    self.currentCap = [batteryStatus[@"AppleRawCurrentCapacity"] integerValue];
    self.maxCap = [batteryStatus[@"AppleRawMaxCapacity"] integerValue];
    NSInteger designCapacity = [batteryStatus[@"DesignCapacity"] integerValue];
    
    self.currentLevel = ((float)self.currentCap/self.maxCap) * 100 > 100 ? 100 : ((float)self.currentCap/self.maxCap) * 100;
    self.batteryTemperature = [batteryStatus[@"Temperature"] integerValue] / 100;
    
    self.instanceCurrent = [batteryStatus[@"InstantAmperage"] integerValue];
    
    self.batteryHealth = ((float)self.maxCap/designCapacity) * 100;
    NSInteger cycleCount = [batteryStatus[@"CycleCount"] integerValue];
    
    NSInteger voltage = [batteryStatus[@"Voltage"] integerValue];
    NSInteger chargingCurrent = [batteryStatus[@"Amperage"] integerValue];
    self.chargerIsPluggedIn = [batteryStatus[@"ExternalConnected"] boolValue];
    self.charging = [batteryStatus[@"IsCharging"] boolValue];
    self.isFullyCharged = [batteryStatus[@"FullyCharged"] boolValue];
    
    self.levelMsg = [[NSString alloc] initWithFormat:@"%.2f%%", self.currentLevel];
    self.batteryTempMsg = [[NSString alloc] initWithFormat:@"%.2f℃", self.batteryTemperature];
    
    self.currentMsg = [[NSString alloc] initWithFormat:@"%ld mA", (long)self.instanceCurrent];
    
    self.healthMsg = [[NSString alloc] initWithFormat:@"%.2f%%", self.batteryHealth];
    self.cycleMsg = [[NSString alloc] initWithFormat:@"%ld", (long)cycleCount];
    
    self.currentCapacityMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)self.currentCap];
    self.maxMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)self.maxCap];
    self.designMsg = [[NSString alloc] initWithFormat:@"%ld mAh", (long)designCapacity];
    self.voltageMsg = [[NSString alloc] initWithFormat:@"%ld mV", (long)voltage];
    self.chargingCurrentMsg = [[NSString alloc] initWithFormat:@"%ld mA", (long)chargingCurrent];
    
    self.manufacturerMsg = [NSString stringWithFormat:@"%@", batteryStatus[@"Manufacturer"]];
    self.serialNumberMsg = [NSString stringWithFormat:@"%@", batteryStatus[@"Serial"]];
}

@end
