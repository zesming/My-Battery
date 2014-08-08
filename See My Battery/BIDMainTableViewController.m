//
//  BIDMainTableViewController.m
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import "BIDMainTableViewController.h"
#import <math.h>
#import <sys/types.h>
#import <sys/sysctl.h>

@interface BIDMainTableViewController ()

@end

@implementation BIDMainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTableViewFrame];
    [self showBatteryInfo];
    self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showBatteryInfo) userInfo:nil repeats:YES];

}

- (void)setTableViewFrame
{
    self.mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.mainTableView.bounds.size.width, 0.1f)];
}

- (NSString *)getDevicePlatform{
    size_t size;
    NSInteger nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    
    NSString *deviceModel;
    
    if(platform)
    {
        /* iPhone设备信息 */
        if([platform isEqualToString:@"iPhone1,1"])
        {
            deviceModel = @"iPhone";
        }else if([platform isEqualToString:@"iPhone1,2"])
        {
            deviceModel = @"iPhone 3G";
        }else if([platform isEqualToString:@"iPhone2,1"])
        {
            deviceModel = @"iPhone 3GS";
        }else if([platform isEqualToString:@"iPhone3,1"])
        {
            deviceModel = @"iPhone 4";
        }else if([platform isEqualToString:@"iPhone3,2"])
        {
            deviceModel = @"iPhone 4";
        }else if([platform isEqualToString:@"iPhone3,3"])
        {
            deviceModel = @"iPhone 4";
        }else if([platform isEqualToString:@"iPhone4,1"])
        {
            deviceModel = @"iPhone 4S";
        }else if([platform isEqualToString:@"iPhone5,1"])
        {
            deviceModel = @"iPhone 5";
        }else if([platform isEqualToString:@"iPhone5,2"])
        {
            deviceModel = @"iPhone 5";
        }else if([platform isEqualToString:@"iPhone5,3"])
        {
            deviceModel = @"iPhone 5C";
        }else if([platform isEqualToString:@"iPhone5,4"])
        {
            deviceModel = @"iPhone 5C";
        }else if([platform isEqualToString:@"iPhone6,1"])
        {
            deviceModel = @"iPhone 5S";
        }else if([platform isEqualToString:@"iPhone6,2"])
        {
            deviceModel = @"iPhone 5S";
        }
        /* iPad设备信息 */
        else if([platform isEqualToString:@"iPad1,1"])
        {
            deviceModel = @"iPad";
        }else if([platform isEqualToString:@"iPad2,1"])
        {
            deviceModel = @"iPad 2";
        }else if([platform isEqualToString:@"iPad2,2"])
        {
            deviceModel = @"iPad 2";
        }else if([platform isEqualToString:@"iPad2,3"])
        {
            deviceModel = @"iPad 2";
        }else if([platform isEqualToString:@"iPad2,4"])
        {
            deviceModel = @"iPad 2";
        }else if([platform isEqualToString:@"iPad2,5"])
        {
            deviceModel = @"iPad mini";
        }else if([platform isEqualToString:@"iPad2,6"])
        {
            deviceModel = @"iPad mini";
        }else if([platform isEqualToString:@"iPad2,7"])
        {
            deviceModel = @"iPad mini";
        }else if([platform isEqualToString:@"iPad3,1"])
        {
            deviceModel = @"iPad 3";
        }else if([platform isEqualToString:@"iPad3,2"])
        {
            deviceModel = @"iPad 3";
        }else if([platform isEqualToString:@"iPad3,3"])
        {
            deviceModel = @"iPad 3";
        }else if([platform isEqualToString:@"iPad3,4"])
        {
            deviceModel = @"iPad 4";
        }else if([platform isEqualToString:@"iPad3,5"])
        {
            deviceModel = @"iPad 4";
        }else if([platform isEqualToString:@"iPad3,6"])
        {
            deviceModel = @"iPad 4";
        }else if([platform isEqualToString:@"iPad4,1"])
        {
            deviceModel = @"iPad Air";
        }else if([platform isEqualToString:@"iPad4,2"])
        {
            deviceModel = @"iPad Air";
        }else if([platform isEqualToString:@"iPad4,4"])
        {
            deviceModel = @"iPad mini Retina";
        }else if([platform isEqualToString:@"iPad4,5"])
        {
            deviceModel = @"iPad mini Retina";
        }
        /* iPod Touch设备信息 */
        else if([platform isEqualToString:@"iPod1,1"])
        {
            deviceModel = @"iPod Touch";
        }else if([platform isEqualToString:@"iPod2,1"])
        {
            deviceModel = @"iPod Touch 2";
        }else if([platform isEqualToString:@"iPod3,1"])
        {
            deviceModel = @"iPod Touch 3";
        }else if([platform isEqualToString:@"iPod4,1"])
        {
            deviceModel = @"iPod Touch 4";
        }else if([platform isEqualToString:@"iPod5,1"])
        {
            deviceModel = @"iPod Touch 5";
        }else{
            deviceModel = platform;
        }
    }else{
        deviceModel = @"Null";
    }
    
    return deviceModel;
}

- (void)showBatteryInfo
{
    self.deviceLabel.text = [self getDevicePlatform];
    self.batteryInfo = [BIDBatteryInfo new];
    [self.batteryInfo initBatteryInfoiOS7];
    
    self.currentBatteryLevel.text = self.batteryInfo.levelMsg;
    
    //通过对电量的判断来显示不同的颜色
    if (self.batteryInfo.currentLevel < 20.00) {
        self.currentBatteryLevel.textColor = [UIColor colorWithRed:0.8 green:0 blue:0.0 alpha:1.0];
    }else{
        self.currentBatteryLevel.textColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0];
    }
    
    //通过颜色来显示电池温度情况
    if (self.batteryInfo.batteryTemperature > 0 && self.batteryInfo.batteryTemperature < 35) {
        self.batteryTempLabel.textColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0];
    }else if(self.batteryInfo.batteryTemperature >= 35){
        self.batteryTempLabel.textColor = [UIColor orangeColor];
    }else{
        self.batteryTempLabel.textColor = [UIColor blueColor];
    }
    
    self.batteryTempLabel.text = self.batteryInfo.batteryTempMsg;
    
    //通过对当前电流判断来显示是充电还是放电
    if (self.batteryInfo.instanceCurrent < 0) {
        self.chargingOrDrainingLabel.text = NSLocalizedString(@"Draining...", @"Draining");
        self.currentLabel.textColor = [UIColor colorWithRed:0.8 green:0 blue:0.0 alpha:1.0];
        self.useOrRemainingLabel.text = NSLocalizedString(@"Can Use", @"Can use");
    }else{
        self.chargingOrDrainingLabel.text = NSLocalizedString(@"Charging...", @"Charging");
        self.currentLabel.textColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0];
        self.useOrRemainingLabel.text = NSLocalizedString(@"Remaining Time", @"Remaining time");
    }
    self.currentLabel.text = self.batteryInfo.currentMsg;
    
    NSString *remainingTimeMsg;
    if (self.batteryInfo.instanceCurrent < 0) {
        float timeHours = (float)self.batteryInfo.currentCap/abs((int)self.batteryInfo.instanceCurrent);
        int hours, mins;
        if (timeHours < 1) {
            hours = 0;
            mins = 60 * timeHours;
        }else{
            hours = timeHours;
            mins = (timeHours - hours) * 60;
        }
        remainingTimeMsg = [[NSString alloc] initWithFormat:NSLocalizedString(@"%d h %d m", @"hours and mins"), hours, mins];
    }else if(self.batteryInfo.instanceCurrent > 0){
        float timeHours;
        int hours, mins;
        if (self.batteryInfo.currentLevel < 80.00) {
            timeHours = (((self.batteryInfo.maxCap * 0.8) - self.batteryInfo.currentCap)/self.batteryInfo.instanceCurrent) + 1;
            hours = timeHours;
            mins = (timeHours - hours) * 60;
        }else{
            hours = 0;
            mins = (100 - self.batteryInfo.currentLevel) * 3;
        }
        remainingTimeMsg = [[NSString alloc] initWithFormat:NSLocalizedString(@"%d h %d m", @"hours and mins"), hours, mins];
    }else if (self.batteryInfo.charging && self.batteryInfo.currentLevel == 100){
        remainingTimeMsg = [[NSString alloc] initWithFormat:NSLocalizedString(@"Trickle Charging...", @"Trickle Charging")];
    }else if (self.batteryInfo.currentLevel == 100 && self.batteryInfo.isFullyCharged){
        remainingTimeMsg = [[NSString alloc] initWithFormat:NSLocalizedString(@"Charging is complete", @"Charging is complete")];
    }
    
    self.remainingTimeLabel.text = remainingTimeMsg;
    
    if (self.batteryInfo.batteryHealth <= 90.00 && self.batteryInfo.batteryHealth > 80.00) {
        self.batteryHeath.textColor = [UIColor colorWithRed:0.5 green:0.75 blue:0 alpha:1.0];
    }else if (self.batteryInfo.batteryHealth > 90.00){
        self.batteryHeath.textColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0];
    }else{
        self.batteryHeath.textColor = [UIColor orangeColor];
    }
    self.batteryHeath.text = self.batteryInfo.healthMsg;
    self.cycleLabel.text = self.batteryInfo.cycleMsg;
    
    self.currentCap.text = self.batteryInfo.currentCapacityMsg;
    self.maxCap.text = self.batteryInfo.maxMsg;
    self.designCap.text = self.batteryInfo.designMsg;
    self.voltageLabel.text = self.batteryInfo.voltageMsg;
    
    if (self.batteryInfo.chargerIsPluggedIn) {
        self.outputLabel.text = self.batteryInfo.chargingCurrentMsg;
    }else{
        self.outputLabel.text = NSLocalizedString(@"No Charger", @"no charger");
    }
    if (!self.batteryInfo.charging && self.batteryInfo.chargerIsPluggedIn) {
        self.fullyChargedLabel.text = NSLocalizedString(@"No Charging", @"no charging");
    }else if(!self.batteryInfo.chargerIsPluggedIn){
        self.fullyChargedLabel.text = NSLocalizedString(@"No Charger", @"no charger");
    }else if(self.batteryInfo.isFullyCharged){
        self.fullyChargedLabel.text = NSLocalizedString(@"Yes", @"yes");
    }else{
        self.fullyChargedLabel.text = NSLocalizedString(@"No", @"no");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
